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


lsp.on_attach(function(client, bufnr)
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { buffer = bufnr, remap = false }
	local set = vim.keymap.set
	local buf = vim.lsp.buf

  -- See `:help vim.lsp.*` for documentation on any of the below functions
	set("n", "gD", function() buf.declaration() end, opts)
  set("n", 'gd', function() buf.definition() end, opts)
  set("n", '<leader>K', function() buf.hover() end, opts)
  set("n", 'gi', function() buf.implementation() end, opts)
  set("n", '<M-k>', function() buf.signature_help() end, opts)
  set("n", '<leader>wa', function() buf.add_workspace_folder() end, opts)
  set("n", '<leader>wr', function() buf.remove_workspace_folder() end, opts)
	set("n", '<leader>wl', function() print(vim.inspect(buf.list_workspace_folders())) end, opts)
  set("n", '<leader>D', function() buf.type_definition() end, opts)
  set("n", '<leader>rn', function() buf.rename() end, opts)
  set("n", '<leader>ca', function() buf.code_action() end, opts)
  set("n", 'gr', function() buf.references() end, opts)
  set("n", '<leader>d', function() vim.lsp.diagnostic.show_line_diagnostics() end, opts)
  set("n", '[d', function() vim.lsp.diagnostic.goto_prev() end, opts)
  set("n", ']d', function() vim.lsp.diagnostic.goto_next() end, opts)
  set("n", '<leader>q', function() vim.lsp.diagnostic.set_loclist() end, opts)
  set("n", '<C-s>', function() buf.formatting() end, opts)

  if client.server_capabilities.document_formatting then
    vim.api.nvim_exec([[
     augroup LspAutocommands
         autocmd! * <buffer>
         autocmd BufWritePost <buffer> lua buf.formatting()
     augroup END
     ]], true)
  end
end)
-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(require('lsp-zero').nvim_lua_ls())

lsp.setup()
