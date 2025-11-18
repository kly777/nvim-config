return {
        -- 现代化状态栏插件
        {
                "nvim-lualine/lualine.nvim",
                dependencies = {
                        "nvim-tree/nvim-web-devicons", -- 文件图标支持
                },
                config = function()
                        local lualine = require("lualine")

                        -- 自定义颜色
                        local colors = {
                                blue   = "#80a0ff",
                                cyan   = "#79dac8",
                                black  = "#080808",
                                white  = "#c6c6c6",
                                red    = "#ff5189",
                                violet = "#d183e8",
                                grey   = "#303030",
                        }

                        lualine.setup({
                                options = {
                                        theme = "auto", -- 自动匹配颜色主题
                                        component_separators = { left = "|", right = "|" },
                                        section_separators = { left = "", right = "" },
                                        disabled_filetypes = {
                                                statusline = { "NvimTree", "alpha" },
                                        },
                                        globalstatus = true, -- 全局状态栏
                                },
                                sections = {
                                        lualine_a = {
                                                {
                                                        "mode",
                                                        fmt = function(str)
                                                                -- 模式缩写
                                                                local mode_map = {
                                                                        ["NORMAL"] = "N",
                                                                        ["INSERT"] = "I",
                                                                        ["VISUAL"] = "V",
                                                                        ["V-LINE"] = "VL",
                                                                        ["V-BLOCK"] = "VB",
                                                                        ["REPLACE"] = "R",
                                                                        ["COMMAND"] = "C",
                                                                }
                                                                return mode_map[str] or str:sub(1, 2)
                                                        end,
                                                },
                                        },
                                        lualine_b = {
                                                {
                                                        "branch",
                                                        icon = "", -- 移除图标
                                                        fmt = function(str)
                                                                return "br:" .. (str:sub(1, 8) or "main")
                                                        end,
                                                },
                                                {
                                                        "diff",
                                                        symbols = {
                                                                added = "+",    -- 添加
                                                                modified = "~", -- 修改
                                                                removed = "-",  -- 删除
                                                        },
                                                        diff_color = {
                                                                added = { fg = colors.cyan },
                                                                modified = { fg = colors.blue },
                                                                removed = { fg = colors.red },
                                                        },
                                                },
                                        },
                                        lualine_c = {
                                                {
                                                        "filename",
                                                        path = 1, -- 显示相对路径
                                                        symbols = {
                                                                modified = " mod", -- 修改状态
                                                                readonly = " ro", -- 只读状态
                                                                unnamed = "[未命名]", -- 未命名文件
                                                        },
                                                },
                                        },
                                        lualine_x = {
                                                {
                                                        "diagnostics",
                                                        sources = { "nvim_diagnostic" },
                                                        symbols = {
                                                                error = "E:", -- 错误
                                                                warn = "W:",  -- 警告
                                                                info = "I:",  -- 信息
                                                                hint = "H:",  -- 提示
                                                        },
                                                },
                                                {
                                                        "encoding",
                                                        fmt = function(str)
                                                                return "enc:" ..
                                                                (str == "utf-8" and "utf8" or str:sub(1, 4))
                                                        end,
                                                },
                                                {
                                                        "fileformat",
                                                        symbols = {
                                                                unix = "LF",  -- Linux/Unix
                                                                dos = "CRLF", -- Windows
                                                                mac = "CR",   -- Mac
                                                        },
                                                },
                                                {
                                                        "filetype"

                                                },
                                        },
                                        lualine_y = {
                                                {
                                                        "progress",
                                                        fmt = function(str)
                                                                return "Ln " .. str
                                                        end,
                                                },
                                        },
                                        lualine_z = {
                                                {
                                                        "location",
                                                        fmt = function(str)
                                                                return "Col " .. str
                                                        end,
                                                },
                                        },
                                },
                                inactive_sections = {
                                        lualine_a = {},
                                        lualine_b = {},
                                        lualine_c = { "filename" },
                                        lualine_x = { "location" },
                                        lualine_y = {},
                                        lualine_z = {},
                                },
                                tabline = {
                                        lualine_a = {
                                                {
                                                        "tabs",
                                                        mode = 2,
                                                        tabs_color = {
                                                                active = "lualine_a_normal",
                                                                inactive = "lualine_a_inactive",
                                                        },
                                                },
                                        },
                                },
                                extensions = { "nvim-tree", "toggleterm", "fugitive" },
                        })
                end,
        },
}
