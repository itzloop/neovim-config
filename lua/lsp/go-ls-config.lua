local nvim_lsp = require('lspconfig')

local function setup(on_attach)
  nvim_lsp.gopls.setup{
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
  },
}


end


return setup
