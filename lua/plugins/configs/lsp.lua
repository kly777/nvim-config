return {
    -- LSP 配置
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
    },

    -- Mason - LSP 管理器
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                -- Lua
                "lua_ls",
                -- Python
                "pyright",
                -- JavaScript/TypeScript
                "tsserver",
                -- Go
                "gopls",
                -- Rust
                "rust_analyzer",
                -- C/C++
                "clangd",
                -- Java
                "jdtls",
                -- HTML/CSS/JSON
                "html",
                "cssls",
                "jsonls",
                -- Markdown
                "marksman",
                -- Shell
                "bashls",
                -- Docker
                "dockerls",
                -- YAML
                "yamlls",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            require("mason-lspconfig").setup({
                automatic_installation = true,
            })
        end,
    },

    -- Mason LSP 配置
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },

    -- LSP 增强 UI
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                lightbulb = {
                    enable = false,
                },
            })
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- LSP 进度显示
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        config = function()
            require("fidget").setup({})
        end,
    },
}
