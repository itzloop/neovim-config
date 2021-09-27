local nvim_lsp = require('lspconfig')


local function setup(on_attach)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  nvim_lsp.cssls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
    },
  }
end


return setup
