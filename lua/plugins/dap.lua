return  {
    {
        "folke/neodev.nvim",
        opts = {
          library = {
            enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
            -- these settings will be used for your Neovim config directory
            runtime = true, -- runtime path
            types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            -- plugins = true, -- installed opt or start plugins in packpath
            -- you can also specify the list of plugins to make available as a workspace library
            plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim", "nvim-dap", "nvim-dap-ui" },
          },
          setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
          -- for your Neovim config directory, the config.library settings will be used as is
          -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
          -- for any other directory, config.library.enabled will be set to false
          -- override = function(root_dir, options) end,
          -- With lspconfig, Neodev will automatically setup your lua-language-server
          -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
          -- in your lsp start options
          lspconfig = true,
          -- much faster, but needs a recent built of lua-language-server
          -- needs lua-language-server >= 3.6.0
          pathStrict = true,
        }

    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "folke/neodev.nvim", "nvim-neotest/nvim-nio" },
        init = function()
            vim.keymap.set('n', '<F5>', function() require("dap").continue() end, { noremap = true, silent = true })
            vim.keymap.set('n', '<F8>', function() require("dap").step_over() end, { noremap = true, silent = true })
            vim.keymap.set('n', '<F9>', function() require("dap").step_into() end, { noremap = true, silent = true })
            vim.keymap.set('n', '<F10>', function() require("dap").step_out() end, { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>b', function() require("dap").toggle_breakpoint() end, { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>B', function() require("dap").set_breakpoint() end, { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>lp', function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>dr', function() require("dap").repl.open() end, { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>dl', function() require("dap").run_last() end, { noremap = true, silent = true })
            vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
              require('require("dap").ui.widgets').hover()
            end, { noremap = true, silent = true })
            vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
              require('require("dap").ui.widgets').preview()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>df', function()
              local widgets = require('require("dap").ui.widgets')
              widgets.centered_float(widgets.frames)
            end, { noremap = true, silent = true })
            vim.keymap.set('n', '<Leader>ds', function()
              local widgets = require('require("dap").ui.widgets')
              widgets.centered_float(widgets.scopes)
            end, { noremap = true, silent = true })
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter" }
    },
}

