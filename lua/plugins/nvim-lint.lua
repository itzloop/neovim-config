local severities ={
    high = vim.diagnostic.severity.ERROR,
    medium = vim.diagnostic.severity.WARN,
    low = vim.diagnostic.severity.INFO,
    -- low = vim.diagnostic.severity.HINT,
}

return {
    "mfussenegger/nvim-lint",
    init = function()
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                -- try_lint without arguments runs the linters defined in `linters_by_ft`
                -- for the current filetype
                require("lint").try_lint()

                -- You can call `try_lint` with a linter name or a list of names to always
                -- run specific linters, independent of the `linters_by_ft` configuration
                -- require("lint").try_lint("golangcilint")
            end,
        })
    end,
    config = function()
        require('lint').linters.golangcilint_custom = {
            cmd = 'golangci-lint',
            append_fname = false,
            args = {
                'run',
                '--out-format',
                'json',
                '--show-stats=false',
                '--print-issued-lines=false',
                '--print-linter-name=false',
                function()
                    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
                end
            },
            stream = 'stdout',
            ignore_exitcode = true,
            parser = function(output, bufnr, cwd)
                if output == '' then
                    return {}
                end
                local decoded = vim.json.decode(output)
                if decoded["Issues"] == nil or type(decoded["Issues"]) == 'userdata' then
                    return {}
                end

                local diagnostics = {}
                for _, item in ipairs(decoded["Issues"]) do
                    local curfile = vim.api.nvim_buf_get_name(bufnr)
                    local lintedfile = cwd .. "/" .. item.Pos.Filename
                    if curfile == lintedfile then
                        -- only publish if those are the current file diagnostics
                        local sv = severities[item.Severity] or severities.warning
                        table.insert(diagnostics, {
                            lnum = item.Pos.Line > 0 and item.Pos.Line - 1 or 0,
                            col = item.Pos.Column > 0 and item.Pos.Column - 1 or 0,
                            end_lnum = item.Pos.Line > 0 and item.Pos.Line - 1 or 0,
                            end_col = item.Pos.Column > 0 and item.Pos.Column - 1 or 0,
                            severity = sv,
                            source = item.FromLinter,
                            message = item.Text,
                        })
                    end
                end
                return diagnostics
            end
        }

        require('lint').linters_by_ft = {
            go = { 'golangcilint_custom' },
        }
    end,
}
