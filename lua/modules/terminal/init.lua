-- TODO create a terminal manager
-- requirementrs
-- - only one terminal should be open at any given time
-- - <leader>t should show/hide a terminal (if not terminal exists create one)
-- - <leader>T should create a new terminal and show that no matter what
-- - there should be a mechanism to switch between open terminals
-- - there should be a conspet of current terminal so the show/hide would wortk properl  local api = vim.api
-- - if current buffer is not the terminal then <leader>t should give the focus to terminal not hide
local M = {}

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

function M.create_window()
  vim.cmd([[ botright 20sp ]])
  wins = vim.api.nvim_list_wins()
  return wins[#wins]
end

function M.toggle_term()
  if M.data.term_open then 
    local temp_win_handle = M.get_curr_term().win_handle
    if vim.api.nvim_win_is_valid(temp_win_handle) then
      vim.api.nvim_win_hide(temp_win_handle)
      M.data.term_open = false
      return
    end
  end

  local win_handle = M.create_window()

  -- create/get a buffer
  local buf_handle = nil
  local curr_term = M.get_curr_term()
  if curr_term == nil or vim.api.nvim_buf_is_valid(curr_term.buf_handle) == false then
    buf_handle = vim.api.nvim_create_buf(false, false)
    if buf_handle == 0 then
      print("error opening buffer")
      return
    end
    M.data.curr_term = M.data.curr_term + 1
    M.data.terminals[M.data.curr_term] = {
      buf_handle = buf_handle,
      win_handle = win_handle
    }

    vim.api.nvim_buf_call(buf_handle, function() vim.cmd([[ terminal ]]) end)

  else
    buf_handle = curr_term.buf_handle
    M.data.terminals[M.data.curr_term] = {
      buf_handle = buf_handle,
      win_handle = win_handle
    }

  end

  M.data.term_open = true
  vim.api.nvim_win_set_buf(win_handle, buf_handle)
end

function M.open_term()
  print("not implemented")
end

function M.hide_term()
  print("not implemented")
end

function M.update_dimentions()
  local stats = vim.api.nvim_list_uis()[1]
  M.data = {
    width = stats.width,
    height = stats.height,
    terminals = {},
    curr_term = 0,
    term_open = false
  }
  print(vim.inspect(M.data))

end

function M.setup(config)
  M.config = config
  vim.api.nvim_set_keymap("n", "<Leader>t", ":lua require('modules.terminal').toggle_term()<CR>", {noremap = true, silent = true})


  M.update_dimentions()
end

return M
