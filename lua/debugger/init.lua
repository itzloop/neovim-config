-- setup overal dap stuff
local dap, dapui = require("dap"), require("dapui")

-- dap mappings
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

dapui.setup()

-- setup events to manage dapui automatically
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- this shows variable info next to each line of code.
require("nvim-dap-virtual-text").setup()


-- Setup per language debug configs
require("debugger.go")
