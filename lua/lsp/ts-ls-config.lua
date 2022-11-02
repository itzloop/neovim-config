local nvim_lsp = require('lspconfig')

local function setup(on_attach)
  
  local format_async = function(err, _, result, _, bufnr)
      if err ~= nil or result == nil then return end
      if not vim.api.nvim_buf_get_option(bufnr, "modified") then
          local view = vim.fn.winsaveview()
          vim.lsp.util.apply_text_edits(result, bufnr)
          vim.fn.winrestview(view)
          if bufnr == vim.api.nvim_get_current_buf() then
              vim.api.nvim_command("noautocmd :update")
          end
      end
  end

  vim.lsp.handlers["textDocument/formatting"] = format_async

  _G.lsp_organize_imports = function()
      local params = {
          command = "_typescript.organizeImports",
          arguments = {vim.api.nvim_buf_get_name(0)},
          title = ""
      }
      vim.lsp.buf.execute_command(params)
  end

  nvim_lsp.tsserver.setup{
    on_attach = function(client)
      client.server_capabilities.document_formatting = false
      on_attach(client)
    end,
    flags = {
      debounce_text_changes = 150,
    },
  }

  -- local filetypes = {
  --   typescript = "eslint",
  --   typescriptreact = "esling"
  -- }

  -- local eslint = {
  --   sourceName = "eslint",
  --   command = "eslint",
  --   rootPatterns = {".eslintrc.js", "package.json"},
  --   debounce = 100,
  --   args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
  --   parseJson = {
  --     errorsRoot = "[0].messages",
  --     line = "line",
  --     column = "column",
  --     endLine = "endLine",
  --     endColumn = "endColumn",
  --     message = "${message} [${ruleId}]",
  --     security = "severity"
  --   },
  --   securities = {[2] = "error", [1] = "warning"}
  -- }

  -- nvim_lsp.diagnosticls.setup {
  --   on_attach = on_attach,
  --   filetypes = vim.tbl_keys(filetypes),
  --   init_options = {
  --     filetypes = filetypes,
  --     linters = {
  --       eslint = eslint,
  --     },
  --     formatters = {
  --       prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
  --     },
  --     formatFiletypes = {
  --       typescript = "prettier",
  --       typescriptreact = "prettier"
  --     }
  --   }
  -- }
end


return setup
