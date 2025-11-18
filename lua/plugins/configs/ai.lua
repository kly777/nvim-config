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
                opts = {
                    language = "Chinese",
                },
                display = {
                    action_palette = {
                        width = 95,
                        height = 10,
                        prompt = "Prompt ",                     -- Prompt used for interactive LLM calls
                        provider = "telescope",                 -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
                        opts = {
                            show_default_actions = true,        -- Show the default actions in the action palette?
                            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                            title = "CodeCompanion actions",    -- The title of the action palette
                        },
                    },
                },
                strategies = {
                    chat = {
                        adapter = "deepseek",
                        model="deepseek-reasoner",
                        tools={

                        }
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
