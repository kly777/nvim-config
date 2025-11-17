return {
        -- 高亮方案
        {
                "rebelot/kanagawa.nvim",
                lazy = false,
                priority = 1000,
                config = function()
                        require("kanagawa").setup({
                                theme = "dragon"
                        })
                        -- 设置默认高亮方案
                        vim.cmd("colorscheme kanagawa")
                end,
        },
}
