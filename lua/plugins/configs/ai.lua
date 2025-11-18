return {
        -- Avante.nvim - 现代化的 AI 代码助手
        {
                "yetone/avante.nvim",
                -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
                -- ⚠️ must add this setting! ! !
                build = vim.fn.has("win32") ~= 0
                    and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
                    or "make",
                event = "VeryLazy",
                version = false, -- Never set this value to "*"! Never!
                ---@module 'avante'
                ---@type avante.Config
                opts = {
                        -- add any opts here
                        -- 这个文件可以包含针对你的项目的特定指令
                        instructions_file = "avante.md",
                        provider = "deepseek",
                        providers = {
                                deepseek = {
                                        __inherited_from = "openai",
                                        endpoint = "https://api.deepseek.com",
                                        model = "deepseek-chat",
                                        timeout = 30000, -- Timeout in milliseconds
                                        extra_request_body = {
                                                temperature = 0.75,
                                                max_tokens = 8192,
                                        },
                                        api_key_name = "DEEPSEEK_API_KEY",
                                },

                        },
                        windows = {
                                position = "right",
                                width = 25, -- 减小宽度
                                sidebar_header = {
                                        enabled = true,
                                        rounded = false, -- 禁用圆角减少渲染开销
                                },
                        },
                },
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        "MunifTanjim/nui.nvim",
                        --- The below dependencies are optional,
                        "nvim-mini/mini.pick", -- for file_selector provider mini.pick
                        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
                        "hrsh7th/nvim-cmp",  -- autocompletion for avante commands and mentions
                        "ibhagwan/fzf-lua",  -- for file_selector provider fzf
                        "stevearc/dressing.nvim", -- for input provider dressing
                        "folke/snacks.nvim", -- for input provider snacks
                        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
                        {
                                -- support for image pasting
                                "HakonHarnes/img-clip.nvim",
                                event = "VeryLazy",
                                opts = {
                                        -- recommended settings
                                        default = {
                                                embed_image_as_base64 = false,
                                                prompt_for_file_name = false,
                                                drag_and_drop = {
                                                        insert_mode = true,
                                                },
                                                -- required for Windows users
                                                use_absolute_path = true,
                                        },
                                },
                        },
                },
        },
}
