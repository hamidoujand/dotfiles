return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            -- list of servers for mason to install and config them with defaults and enables them.
            ensure_installed = {
                "ts_ls",
                "html",
                "cssls",
                "lua_ls",
                "emmet_ls",
                "gopls",
            },
        },
        dependencies = {
            {
                -- mason itself to use :Mason command
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            "neovim/nvim-lspconfig",
        },
    },
    --use for installing Debuggers , Formatters , Linters
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua",   -- lua formatter
                "gofumpt",
                "goimports",
                "golines",
                'delve', -- Go debugger
            },
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
}
