return {

        -- ========================
        -- 彩虹括号插件
        -- ========================
        {
                "HiPhish/rainbow-delimiters.nvim",
                event = { "BufReadPost", "BufNewFile" },
                config = function()
                        local rainbow_delimiters = require("rainbow-delimiters")

                        -- 彩虹括号策略配置
                        local strategy = {
                                [""] = rainbow_delimiters.strategy["global"],
                                commonlisp = rainbow_delimiters.strategy["local"],
                        }

                        -- 彩虹括号查询配置
                        local query = {
                                [""] = "rainbow-delimiters",
                                latex = "rainbow-blocks",
                        }

                        -- 彩虹括号高亮配置
                        local highlight = {
                                -- 9 种不同的括号颜色，循环使用
                                "RainbowDelimiterRed",
                                "RainbowDelimiterYellow",
                                "RainbowDelimiterBlue",
                                "RainbowDelimiterOrange",
                                "RainbowDelimiterGreen",
                                "RainbowDelimiterViolet",
                                "RainbowDelimiterCyan",
                                "RainbowDelimiterMagenta",
                                "RainbowDelimiterGray",
                        }

                        -- 设置彩虹括号
                        require("rainbow-delimiters.setup")({
                                strategy = strategy,
                                query = query,
                                highlight = highlight,
                        })

                        -- 自定义彩虹括号颜色
                        vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#FF6B6B" })
                        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#F9CB40" })
                        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#4DABF7" })
                        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#FF922B" })
                        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#51CF66" })
                        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#CC5DE8" })
                        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#22B8CF" })
                        vim.api.nvim_set_hl(0, "RainbowDelimiterMagenta", { fg = "#F06595" })
                        vim.api.nvim_set_hl(0, "RainbowDelimiterGray", { fg = "#868E96" })
                end,
        },
}
