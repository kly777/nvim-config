return {

    -- ========================
    -- 文件大纲插件
    -- ========================
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- ========================
            -- 布局配置
            -- ========================
            layout = {
                max_width = { 40, 0.2 },
                width = nil,
                min_width = 10,
                win_opts = {},
                default_direction = "prefer_right",
                placement = "edge",
                resize_to_content = true,
            },

            -- ========================
            -- 符号配置
            -- ========================
            attach_mode = "global",
            backends = { "lsp", "treesitter", "markdown" },
            disable_max_lines = 10000,
            disable_max_size = 2000000,
            filter_kind = false,
            guides = {
                mid_item = "├ ",
                last_item = "└ ",
                nested_top = "│ ",
                whitespace = "  ",
            },

            -- ========================
            -- 图标配置
            -- ========================
            icons = {},
            ignore = {
                unlisted_buffers = true,
                filetypes = {},
                buftypes = "special",
            },

            -- ========================
            -- 管理配置
            -- ========================
            manage_folds = false,
            link_folds_to_tree = false,
            link_tree_to_folds = true,
            nerd_font = "auto",
            on_attach = function(bufnr) end,

            -- ========================
            -- 显示配置
            -- ========================
            show_guides = true,
            auto_jump = false,
            close_automatic_events = {},
            close_behavior = "auto",
            highlight_closest = true,
            highlight_mode = "split_width",
            highlight_on_hover = false,
            highlight_on_jump = 300,
            open_automatic = false,

            -- ========================
            -- 排序配置
            -- ========================
            sort = {
                kind = false,
            },

            -- ========================
            -- LSP 配置
            -- ========================
            lsp = {
                diagnostics_trigger_update = true,
                update_when_errors = true,
                update_delay = 300,
            },
        },
        config = function(_, opts)
            require("aerial").setup(opts)
        end,
    },
}
