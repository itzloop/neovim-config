return {
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
          numhl      = true,
          current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
          current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 100,
          },
        }
    }
}
