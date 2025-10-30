--v1

-- return { -- Autoformat
--     'stevearc/conform.nvim',
--     event = { 'BufReadPre', 'BufWritePre', 'BufNewFile' },
--     cmd = { 'ConformInfo' },
--     keys = {
--         {
--             '<leader>f',
--             function()
--                 require('conform').format { async = true, lsp_format = 'fallback' }
--             end,
--             mode = '',
--             desc = '[F]ormat buffer',
--         },
--     },
--     opts = {
--         notify_on_error = false,
--         format_on_save = function(bufnr)
--             -- Disable "format_on_save lsp_fallback" for languages that don't
--             -- have a well standardized coding style. You can add additional
--             -- languages here or re-enable it for the disabled ones.
--             local disable_filetypes = { c = true, cpp = true }
--             if disable_filetypes[vim.bo[bufnr].filetype] then
--                 return nil
--             else
--                 return {
--                     timeout_ms = 3000, -- 🚀 INCREASED FROM 500ms TO 3000ms
--                     lsp_format = 'fallback',
--                 }
--             end
--         end,
--         formatters_by_ft = {
--             lua = { 'stylua' },
--             -- 🚀 ADD Go FORMATTERS HERE
--             go = { 'gofumpt', 'goimports' }, -- Use gofumpt first, then goimports
--             -- Conform can also run multiple formatters sequentially
--             -- python = { "isort", "black" },
--             --
--             -- You can use 'stop_after_first' to run the first available formatter from the list
--             -- javascript = { "prettierd", "prettier", stop_after_first = true },
--             html = { 'prettier' },
--             css = { 'prettier' },
--             json = { 'prettier' },
--             yaml = { 'prettier' },
--             markdown = { 'prettier' },
--         },
--     },
-- }


--------------------------------------------------------------------------------
---v2
return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                lua = { "stylua" },
                go = { 'gofumpt', 'goimports', "golines" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 3000,
            },

            formatters = {
                golines = {
                    command = "golines",
                    args = { "--max-len=80" },
                },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
