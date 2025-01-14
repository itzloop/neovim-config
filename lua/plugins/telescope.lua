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
-- setup
telescope.setup {
  extensions = {
      fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

-- telescope.load_extension('fzy_native')
telescope.load_extension('fzf')
telescope.load_extension("live_grep_args")
