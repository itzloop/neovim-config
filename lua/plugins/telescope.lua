-- Replaced in favor of live_grep_args
-- vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", opts )

return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
          dependencies = {
              "nvim-lua/plenary.nvim",
              "nvim-telescope/telescope-live-grep-args.nvim",
                "nvim-telescope/telescope-fzf-native.nvim"
          },
          init = function ()
            local telescope = require("telescope")

            -- mappings

            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", opts )
            -- Replaced in favor of live_grep_args
            -- vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", opts )
            vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
            vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", opts )
            vim.keymap.set("n", "<Leader>fh", ":Telescope help_tags<CR>", opts )
            vim.keymap.set("n", "<Leader>@", ":Telescope treesitter<CR>", opts )
            vim.keymap.set("n", "<Leader>e", ":Telescope file_browser<CR>", opts )
            vim.keymap.set("n", "<Leader>ds", ":Telescope lsp_document_symbols<CR>", opts )
          end,
          opts = {
              fzf = {
                  fuzzy = true,                    -- false will only do exact matching
                  override_generic_sorter = true,  -- override the generic sorter
                  override_file_sorter = true,     -- override the file sorter
                  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            }
          },
          config = function ()
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("live_grep_args")
          end
    }
}
