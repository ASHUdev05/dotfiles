return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        -- Mason
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "html",
                "cssls",
                "jdtls",
                "pyright", 
                "gopls", 
                "omnisharp", 
                "eslint",
                "clangd",
                "rust_analyzer"
            },
        })

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })

        vim.lsp.config("html", { capabilities = capabilities })
        vim.lsp.config("cssls", { capabilities = capabilities })
        vim.lsp.config("jdtls", { capabilities = capabilities })

        -- Enable servers
        for _, server in ipairs({
            "lua_ls",
            "ts_ls",
            "html",
            "cssls",
            "jdtls",
            "clangd",
            "rust_analyzer"
        }) do
            vim.lsp.enable(server)
        end

        -- Keymaps
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
}