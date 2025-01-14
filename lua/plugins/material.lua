-- For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
-- if (has('nvim')) let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
-- endif


-- For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
-- Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
-- https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
-- material_theme_style = 'default' 
--				  | 'palenight' 
--				  | 'ocean' 
--				  | 'lighter' 
--				  | 'darker' 
--				  | 'default-community' 
--				  | 'palenight-community' 
--				  | 'ocean-community' 
--				  | 'lighter-community' 
--				  | 'darker-community'

return {
    "marko-cerovac/material.nvim",
    lazy = false,
    init = function()
        if vim.fn.has("termguicolors") then
            vim.opt.termguicolors = true
        end
        
        vim.g.material_style = "darker"
        vim.cmd('colorscheme material')
    end,
    opts = {
        contrast = {
            terminal = false, -- Enable contrast for the built-in terminal
            sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
            floating_windows = false, -- Enable contrast for floating windows
            cursor_line = false, -- Enable darker background for the cursor line
            non_current_windows = false, -- Enable darker background for non-current windows
            filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
            comments = { --[[ italic = true ]] },
            strings = { --[[ bold = true ]] },
            keywords = { --[[ underline = true ]] },
            functions = { --[[ bold = true, undercurl = true ]] },
            variables = {},
            operators = {},
            types = {},
        },

        plugins = { -- Uncomment the plugins that you use to highlight them
            -- Available plugins:
            "dap",
            -- "dashboard",
            "gitsigns",
            -- "hop",
            -- "indent-blankline",
            -- "lspsaga",
            -- "mini",
            -- "neogit",
            -- "neorg",
            -- "nvim-cmp",
            -- "nvim-navic",
            -- "nvim-tree",
            -- "nvim-web-devicons",
            -- "sneak",
            "telescope",
            -- "trouble",
            -- "which-key",
        },

        disable = {
            colored_cursor = false, -- Disable the colored cursor
            borders = false, -- Disable borders between verticaly split windows
            background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
            term_colors = false, -- Prevent the theme from setting terminal colors
            eob_lines = false -- Hide the end-of-buffer lines
        },

        high_visibility = {
            lighter = false, -- Enable higher contrast text for lighter style
            darker = true -- Enable higher contrast text for darker style
        },

        lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

        custom_colors = nil, -- If you want to everride the default colors, set this to a function

        custom_highlights = {}, -- Overwrite highlights with your own
    },
    config = function()
    end
}

