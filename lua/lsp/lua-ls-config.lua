local lspconfig = require('lspconfig')

local function setup(on_attach)
	lspconfig.lua_ls.setup {
		settings = {
			Lua = {
        completion = {
          callSnippet = "Replace"
        },
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = {'vim'},
				},
			},
		},
	}
end

return setup
