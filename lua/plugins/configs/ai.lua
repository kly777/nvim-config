return {
    -- CodeCompanion.nvim - 现代化的 AI 代码助手
    {
        "olimorris/codecompanion.nvim",
        opts = {

        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- 可选依赖
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "deepseek",
                        model = "deepseek-chat"
                    },
                    inline = {
                        adapter = "deepseek",
                    },
                    cmd = {
                        adapter = "deepseek",
                    },
                },
                adapters = {
                    http = {
                        deepseek = function()
                            return require("codecompanion.adapters").extend("deepseek", {
                                env = {
                                    api_key = "DEEPSEEK_API_KEY"
                                },
                            })
                        end
                    }
                }
            })
        end
    },
}
