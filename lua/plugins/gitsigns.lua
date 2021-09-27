require("gitsigns").setup{
  numhl      = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 100,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
}
