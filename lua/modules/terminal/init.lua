-- TODO create a terminal manager
-- requirementrs
-- - only one terminal should be open at any given time
-- + <leader>t should show/hide a terminal (if not terminal exists create one)
-- - <leader>T should create a new terminal and show that no matter what
-- - there should be a mechanism to switch between open terminals
-- - there should be a conspet of current terminal so the show/hide would wortk properl  local api = api
-- - if current buffer is not the terminal then <leader>t should give the focus to terminal not hide
-- ****************** NOTES ******************
-- you can use nvim_get_current_buf() and nvim_get_current_win() :)
--
local M = {}
local api = vim.api
M.config = {}
M.data = { 
  width = 0,
  height = 0,
  terminals = {},
  curr_term = 0,
  term_open = false
}

function M.get_curr_term()
  return M.data.terminals[M.data.curr_term]
end

function M.get_top_window()
  local wins = api.nvim_list_wins()
  return wins[#wins]
end

function M.create_window()
  vim.cmd([[ botright 20sp ]])
  local wins = api.nvim_list_wins()
  return wins[#wins]
end

function M.toggle_term()
  -- hide the terminal if it's open
  if M.data.term_open then
    local temp_win_handle = M.get_curr_term().win_handle
    if api.nvim_win_is_valid(temp_win_handle) then
      if M.is_in_buf() == false then
        api.nvim_set_current_win(M.get_curr_term().win_handle)
      else
        M.hide_term()
      end
      return
    end
  end

  -- create/get a buffer
  local term = M.get_curr_term()
  if term == nil or api.nvim_buf_is_valid(term.buf_handle) == false then
    term = M.create_term()
    M.store_term(term)

  else
    -- buff exists so just create a window
    term = {
      buf_handle = term.buf_handle,
      win_handle = M.create_window()
    }

    M.update_curr_term(term.buf_handle, term.win_handle)
  end

  M.show_term(term)
end


-- creates a new terminal and returns the buf_handle
function M.create_term()
  local win_handle = M.create_window()
  local buf_handle = M.new_buf()
  api.nvim_buf_call(buf_handle, function()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.cmd([[ terminal ]])
  end)
  return {
    buf_handle = buf_handle,
    win_handle = win_handle
  }
end

function M.show_term(term)
  M.data.term_open = true
  api.nvim_win_set_buf(term.win_handle, term.buf_handle)
end

function M.hide_term()
  local term = M.get_curr_term()
  api.nvim_win_hide(term.win_handle)
  M.data.term_open = false
end

function M.store_term(term)
  -- add new term to the list and inc the cur_term
  M.data.curr_term = M.data.curr_term + 1
  M.data.terminals[M.data.curr_term] = {
    buf_handle = term.buf_handle,
    win_handle = term.win_handle
  }
end

function M.update_curr_term(buf_handle, win_handle)
  -- add new term to the list and inc the cur_term
  M.data.terminals[M.data.curr_term] = {
    buf_handle = buf_handle,
    win_handle = win_handle
  }
end

function M.vsplit_term()
  local term = M.data.terminals[M.data.curr_term]
  api.nvim_buf_call(term.buf_handle, function() vim.cmd("vsplit") end)
  local buf_handle = M.new_buf()
  local win_handle = M.get_top_window()
  term = {
    buf_handle = buf_handle,
    win_handle = win_handle
  }
  api.nvim_buf_call(buf_handle, function() vim.cmd("terminal") end)
  M.store_term(term)
  M.show_term(term)
end

function M.hsplit_term()
  local term = M.data.terminals[M.data.curr_term]
  api.nvim_buf_call(term.buf_handle, function() vim.cmd("split") end)
  local buf_handle = M.new_buf()
  local win_handle = M.get_top_window()
  term = {
    buf_handle = buf_handle,
    win_handle = win_handle
  }
  api.nvim_buf_call(buf_handle, function() vim.cmd("terminal") end)
  M.store_term(term)
  M.show_term(term)
end


function M.new_buf()
  local buf_handle = api.nvim_create_buf(false, false)
  if buf_handle == 0 then
    -- print("error opening buffer")
    return nil
  end

  return buf_handle
end

function M.update_dimentions()
  local stats = api.nvim_list_uis()[1]
  M.data = {
    width = stats.width,
    height = stats.height,
    terminals = {},
    curr_term = 0,
    term_open = false
  }
  -- print(vim.inspect(M.data))

end

function M.is_in_buf()
  local curr_buff_handle = api.nvim_get_current_buf()
  for _, term in pairs(M.data.terminals) do
    if curr_buff_handle == term.buf_handle then
      return true
    end
  end

  return false

end


function M.setup(config)
  M.config = config
  api.nvim_set_keymap("n", "<Leader>t", ":lua require('modules.terminal').toggle_term()<CR>", {noremap = true, silent = true})
  api.nvim_set_keymap("n", "<M-(>", ":lua require('modules.terminal').vsplit_term()<CR>", {noremap = true, silent = true})
  api.nvim_set_keymap("n", "<M-)>", ":lua require('modules.terminal').hsplit_term()<CR>", {noremap = true, silent = true})


  M.update_dimentions()
end

return M
