require("modules.terminal").setup{}

local modules = {
  {
    name = "modules.terminal",
    config = {}
  },
  -- {
  --   name = "modules.statusline",
  --   config = {}
  -- }
}

-- reload modules
function reload_modules()
  print("hello")
  for _, module in pairs(modules) do
    for k in pairs(package.loaded) do
      if k:match(module.name) then
        package.loaded[k] = nil
        require(module.name).setup(module.config)
      end
    end
  end
end

-- load my modules
for _, module in pairs(modules) do
  require(module.name).setup(module.config)
end

vim.api.nvim_set_keymap("n", "<Leader>r", ":lua reload_modules()<CR>", {noremap = true, silent = true})
