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

                },
                config = function(_, opts)
                        require("mason").setup(opts)
                        require("mason-lspconfig").setup({
                                automatic_installation = true,
                                ensure_installed = {
                                        "html",
                                        "emmet_ls",
                                }
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
                "nvimdev/lspsaga.nvim",
                event = "LspAttach",
                config = function()
                        require("lspsaga").setup({
                                lightbulb = {
                                        enable = false,
                                },
                                -- 悬停文档窗口配置
                                hover = {
                                        max_width = 0.9,
                                        max_height = 0.8,
                                        open_link = "gx",
                                        open_cmd = "!chrome",
                                },
                                -- 浮动窗口样式配置
                                ui = {
                                        -- 边框样式
                                        border = "rounded",
                                        -- 窗口颜色
                                        colors = {
                                                normal_bg = "#1a1b26",
                                                title_bg = "#16161e",
                                                red = "#f7768e",
                                                magenta = "#bb9af7",
                                                orange = "#ff9e64",
                                                yellow = "#e0af68",
                                                green = "#9ece6a",
                                                cyan = "#7dcfff",
                                                blue = "#7aa2f7",
                                                white = "#c0caf5",
                                                black = "#16161e",
                                        },
                                        -- 标题样式
                                        title = true,
                                        -- 浮动窗口圆角
                                        rounded = true,
                                        -- 窗口透明度
                                        opacity = 0.95,
                                        -- 线条样式
                                        lines = {
                                                "┌", "─", "┐", "│", "┘", "─", "└", "│",
                                        },
                                },
                        })
                end,
                dependencies = {
                        "nvim-tree/nvim-web-devicons",     -- optional
                        'nvim-treesitter/nvim-treesitter', -- optional
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
