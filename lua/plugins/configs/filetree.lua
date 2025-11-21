return {
    -- 文件树插件
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                arrow_closed = "",
                                arrow_open = "",
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "✗",
                                staged = "✓",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "★",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                            modified = true, -- 显示修改状态
                        },
                    },
                    highlight_modified = "all", -- 高亮所有修改的文件
                    indent_markers = {
                        enable = true,
                        inline_arrows = true,
                        icons = {
                            corner = "└",
                            edge = "│",
                            item = "│",
                            bottom = "─",
                            none = " ",
                        },
                    },
                },
                modified = {
                    enable = true,            -- 启用修改状态显示
                    show_on_dirs = true,      -- 在目录上显示修改状态
                    show_on_open_dirs = true, -- 在打开的目录上显示修改状态
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },

    -- 文件图标支持
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
