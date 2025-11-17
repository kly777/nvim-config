return {
        -- 高亮方案
        {
                "folke/tokyonight.nvim",
                lazy = false,
                priority = 1000,
                config = function()
                        require("tokyonight").setup({
                                -- 可选配置，使用默认设置
                                style = "night", -- 可选: storm, night, day
                                transparent = false,
                                terminal_colors = true,
                                styles = {
                                        comments = { italic = true },
                                        keywords = { italic = true },
                                        functions = { bold = true },
                                        variables = {},
                                        sidebars = "dark",
                                        floats = "dark",
                                },
                        })
                        -- 设置默认高亮方案
                        vim.cmd("colorscheme tokyonight")
                end,
        },
}
