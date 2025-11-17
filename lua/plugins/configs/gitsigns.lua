return {
        -- Git 状态显示插件 (在行号旁边显示 Git 状态)
        {
                "lewis6991/gitsigns.nvim",
                event = { "BufReadPre", "BufNewFile" },
                opts = {
                        signs = {
                                add = { text = "│" },
                                change = { text = "│" },
                                delete = { text = "_" },
                                topdelete = { text = "‾" },
                                changedelete = { text = "~" },
                                untracked = { text = "┆" },
                        },
                        signcolumn = true, -- 在行号列显示 Git 状态
                        numhl = true,      -- 不在行号上高亮
                        linehl = false,    -- 不在行上高亮
                        word_diff = false, -- 不显示单词差异
                        watch_gitdir = {
                                follow_files = true,
                        },
                        attach_to_untracked = true,
                        current_line_blame = false, -- 不在当前行显示 blame
                        current_line_blame_opts = {
                                virt_text = true,
                                virt_text_pos = "eol",
                                delay = 1000,
                                ignore_whitespace = false,
                        },
                        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                        sign_priority = 6,
                        update_debounce = 100,
                        status_formatter = nil, -- 使用默认状态格式化
                        max_file_length = 40000,
                        preview_config = {
                                -- 预览配置
                                border = "single",
                                style = "minimal",
                                relative = "cursor",
                                row = 0,
                                col = 1,
                        },
                },
                config = function(_, opts)
                        -- 加载 gitsigns
                        require("gitsigns").setup(opts)
                end,
        },
}
