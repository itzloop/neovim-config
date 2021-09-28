local M = {}

M.config = {}
M.internals = {
  debug = true,
  module_name = "statusline",
  colors = {
    bg = "#0a0c12",
    fg = "#484f67"
  },
  modes = {
    ["n"]  = "N",
    ["no"] = "N·P",
    ["v"]  = "V",
    ["V"]  = "V·L",
    [''] = "V.B",
    ["s"]  = "S",
    ["S"]  = "S·L",
    [''] = "S·B",
    ["i"]  = "I",
    ["ic"] = "I",
    ["R"]  = "R",
    ["Rv"] = "V·R",
    ["c"]  = "C",
    ["cv"] = "V·E",
    ["ce"] = "E",
    ["r"]  = "P",
    ["rm"] = "M",
    ["r?"] = "C",
    ["!"]  = "S",
    ["t"]  = "T",
  }
}

function M.print(str)
  if debug == false then return end
  print(string.format("%s: %s", M.internals.module_name, str))
end

function M.setup(_)
  -- vim.o.statusline = "%{luaeval('require(\"modules.statusline\").init()')}"
  vim.o.statusline ="%!luaeval('require(\"modules.statusline\").init()')"
end

function M.init()
  M.highlight("Test", M.internals.colors.fg, M.internals.colors.bg)


  return table.concat{
    "%#Test#",
    " ",
    M.get_mode(),
    " | %m %f |",
    M.git_status(),
    "%=",
    "%l:%c | %p%%  "
  }
end

function M.git_status()
  local signs = vim.b.gitsigns_status_dict or { added = "", changed = "", removed = "", head = "" }
  if signs == nil then
    -- M.print("gitsigns is required")
    return ""
  end
  local git_icon = ""
  return signs.head ~= "" and
    string.format(" +%s ~%s -%s | %s %s ",
      signs.added, signs.changed, signs.removed, signs.head, git_icon)
  or " not a git repo "
end

function M.get_mode()
  local mode = M.internals.modes[vim.api.nvim_get_mode().mode]
  if mode == nil then return "U" end
  return mode
end


function M.highlight(group, fg, bg)
    vim.cmd("highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
end

return M
