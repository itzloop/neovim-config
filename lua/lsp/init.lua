local lsp = require('lsp-zero')

lsp.preset("recommended")
lsp.ensure_installed({
	"gopls",
	"bashls",
	"yamlls",
	"jsonls",
	"bufls",
	"pyright",
	"tsserver",
	"lua_ls"
})
local on_attach = function(client, bufnr)
	-- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	-- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	-- Enable completion triggered by <c-x><c-o>
	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { buffer = bufnr, remap = false }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", 'gd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", '<leader>K', function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", 'gi', function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", '<M-k>', function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
	vim.keymap.set("n", '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
	vim.keymap.set("n", '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
	vim.keymap.set("n", '<leader>D', function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("n", '<leader>rn', function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", 'gr', function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", '<leader>d', function() vim.lsp.diagnostic.show_line_diagnostics() end, opts)
	vim.keymap.set("n", '[d', function() vim.lsp.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", ']d', function() vim.lsp.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", '<leader>q', function() vim.lsp.diagnostic.set_loclist() end, opts)
	vim.keymap.set("n", '<C-s>', function() vim.lsp.buf.format({ async = true }) end, opts)

	if client.server_capabilities.document_formatting then
		vim.api.nvim_exec([[
     augroup LspAutocommands
         autocmd! * <buffer>
         autocmd BufWritePost <buffer> lua buf.formatting()
     augroup END
     ]], true)
	end
end
lsp.on_attach(on_attach)
-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(require('lsp-zero').nvim_lua_ls())
lsp.setup()

require("lsp.lua-ls-config")(on_attach)
