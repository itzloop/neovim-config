local nvim_lsp = require('lspconfig')

local function setup(on_attach)
  nvim_lsp.ccls.setup {
    init_options = {
      compilationDatabaseDirectory = "build";
      index = {
        threads = 0;
      };
      clang = {
        excludeArgs = { "-frounding-math"} ;
      };
    },
    on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
    },
  }
end

return setup
