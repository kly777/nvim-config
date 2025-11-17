return {
        -- 缩进可视化插件 - 增强版
        {
                "lukas-reineke/indent-blankline.nvim",
                event = { "BufReadPost", "BufNewFile" },
                main = "ibl",
                dependencies = {
                        "nvim-treesitter/nvim-treesitter", -- 依赖 treesitter 获得更好的作用域识别
                },
                opts = {
                        -- ========================
                        -- 缩进线配置
                        -- ========================
                        indent = {
                                -- 缩进线字符配置
                                char = "│", -- 主缩进线字符，清晰的垂直线条
                                tab_char = "│", -- 制表符缩进线

                                -- 高亮配置
                                highlight = {
                                        -- 不同缩进级别使用不同颜色
                                        "Whitespace", -- 基础缩进高亮
                                        "NonText", -- 非文本区域高亮
                                },
                        },

                        -- ========================
                        -- 作用域配置
                        -- ========================
                        scope = {
                                enabled = true, -- 启用作用域显示
                                show_start = true, -- 显示作用域开始位置
                                show_end = true, -- 显示作用域结束位置

                                -- 作用域字符配置 - 不同作用域使用不同符号
                                char = "▏", -- 默认作用域字符

                                -- 作用域高亮配置
                                highlight = {
                                        -- 使用标准的高亮组，避免不存在的组名
                                        "Function", -- 函数作用域
                                        "Statement", -- 语句作用域
                                        "Type", -- 类型作用域
                                        "Constant", -- 常量作用域
                                        "Identifier", -- 标识符作用域
                                        "PreProc", -- 预处理作用域
                                        "Special", -- 特殊作用域
                                        "Comment", -- 注释作用域
                                },

                                -- 作用域优先级配置
                                priority = 100, -- 作用域显示优先级

                                -- 作用域显示配置
                                show_exact_scope = true, -- 精确显示作用域范围
                                injected_languages = true, -- 支持注入的语言
                        },

                        -- ========================
                        -- 排除配置
                        -- ========================
                        exclude = {
                                filetypes = {
                                        -- 不需要缩进线的文件类型
                                        "help", -- 帮助文件
                                        "alpha", -- 启动界面
                                        "dashboard", -- 仪表板
                                        "neo-tree", -- 文件树
                                        "Trouble", -- 问题列表
                                        "trouble", -- 问题列表（别名）
                                        "lazy", -- 插件管理器
                                        "mason", -- LSP 管理器
                                        "notify", -- 通知窗口
                                        "toggleterm", -- 终端
                                        "lazyterm", -- 懒加载终端
                                        "fugitive", -- Git 界面
                                        "fugitiveblame", -- Git blame
                                        "qf", -- 快速修复列表
                                        "netrw", -- 文件浏览器
                                        "NvimTree", -- 文件树（旧版）
                                },
                        },
                },
                config = function(_, opts)
                        -- 加载 indent-blankline
                        require("ibl").setup(opts)

                        -- 创建自定义高亮组用于不同作用域
                        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#404040", nocombine = true })
                        vim.api.nvim_set_hl(0, "IblScope", { fg = "#FF6B6B", nocombine = true })

                        -- 为不同作用域类型创建高亮组
                        vim.api.nvim_set_hl(0, "IblScopeFunction", { fg = "#FF6B6B", nocombine = true })
                        vim.api.nvim_set_hl(0, "IblScopeStatement", { fg = "#4DABF7", nocombine = true })
                        vim.api.nvim_set_hl(0, "IblScopeType", { fg = "#51CF66", nocombine = true })
                        vim.api.nvim_set_hl(0, "IblScopeConstant", { fg = "#F9CB40", nocombine = true })
                        vim.api.nvim_set_hl(0, "IblScopeIdentifier", { fg = "#CC5DE8", nocombine = true })
                        vim.api.nvim_set_hl(0, "IblScopePreProc", { fg = "#22B8CF", nocombine = true })
                        vim.api.nvim_set_hl(0, "IblScopeSpecial", { fg = "#F06595", nocombine = true })
                        vim.api.nvim_set_hl(0, "IblScopeComment", { fg = "#868E96", nocombine = true })
                end,
        },

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
