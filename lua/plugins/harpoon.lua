return {
    "ThePrimeagen/harpoon",
    init = function()
        vim.g.harpoon_log_level="info"
    end,
    opts = {
        global_settings = {
            -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
            save_on_toggle = false,

            -- saves the harpoon file upon every change. disabling is unrecommended.
            save_on_change = true,

            -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
            enter_on_sendcmd = false,

            -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
            tmux_autoclose_windows = false,

            -- filetypes that you want to prevent from adding to the harpoon list menu.
            excluded_filetypes = { "harpoon" },

            -- set marks specific to each git branch inside git repository
            mark_branch = false,

            -- enable tabline with harpoon marks
            tabline = false,
            tabline_prefix = "   ",
            tabline_suffix = "   ",
        }
    },
    keys = {
        {
            "<leader>a",
            function() require("harpoon.mark").add_file() end,
        },
        {
            "<C-e>",
            function() require("harpoon.ui").toggle_quick_menu() end,
        },
        {
            "<Tab>",
            function() require("harpoon.ui").nav_next() end,
        },
        {
            "<S-Tab>",
            function() require("harpoon.ui").nav_prev() end,
        },

        {
            "<leader>1",
            function () require("harpoon.ui").nav_file(1) end,
        },
        {
            "<leader>2",
            function () require("harpoon.ui").nav_file(2) end,
        },
        {
            "<leader>3",
            function () require("harpoon.ui").nav_file(3) end,
        },
        {
            "<leader>4",
            function () require("harpoon.ui").nav_file(4) end,
        },
        {
            "<leader>5",
            function () require("harpoon.ui").nav_file(5) end,
        },
        {
            "<leader>6",
            function () require("harpoon.ui").nav_file(6) end,
        },
        {
            "<leader>7",
            function () require("harpoon.ui").nav_file(7) end,
        },
        {
            "<leader>8",
            function () require("harpoon.ui").nav_file(8) end,
        },
        {
            "<leader>9",
            function () require("harpoon.ui").nav_file(9) end,
        },
    }
}
