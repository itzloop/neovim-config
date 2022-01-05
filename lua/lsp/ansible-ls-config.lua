local nvim_lsp = require('lspconfig')

local function setup(on_attach)
  nvim_lsp.ansiblels.setup{
    on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
    },
  }
end


return setup

