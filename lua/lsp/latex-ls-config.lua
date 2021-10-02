
local nvim_lsp = require('lspconfig')
local util = require('lspconfig.util')
local function setup(on_attach)
  require'lspconfig'.texlab.setup{
    cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    root_dir = util.root_pattern(".git", "root_dir.json"),
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = false
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {}
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false
        }
      }
    },
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

return setup
