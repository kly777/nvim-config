return {
        -- 系统剪切板集成 (主要解决方案)
        {
                "ojroques/nvim-osc52",
                config = function()
                        require("osc52").setup({
                                max_length = 0, -- 禁用最大长度限制
                                silent = false, -- 禁用静默模式
                                trim = false, -- 禁用修剪
                        })

                        -- 设置复制到系统剪切板的快捷键
                        vim.keymap.set("v", "<leader>y", require("osc52").copy_visual, { desc = "复制到系统剪切板 (osc52)" })
                        vim.keymap.set("n", "<leader>Y", require("osc52").copy_operator, { desc = "复制操作到系统剪切板 (osc52)" })

                        -- 设置粘贴快捷键
                        vim.keymap.set("n", "<leader>p", function()
                                vim.fn.setreg('"', vim.fn.getreg('+'))
                                vim.cmd('normal! p')
                        end, { desc = "从系统剪切板粘贴" })

                        vim.keymap.set("v", "<leader>p", function()
                                vim.fn.setreg('"', vim.fn.getreg('+'))
                                vim.cmd('normal! p')
                        end, { desc = "从系统剪切板粘贴" })
                end,
        },

        -- 剪切板历史管理
        {
                "AckslD/nvim-neoclip.lua",
                dependencies = {
                        "kkharji/sqlite.lua",
                        "nvim-telescope/telescope.nvim",
                },
                config = function()
                        require("neoclip").setup({
                                history = 1000,
                                enable_persistent_history = true,
                                continuous_sync = true,
                                db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
                                filter = nil,
                                preview = true,
                                prompt = nil,
                                default_register = '"',
                                default_register_macros = 'q',
                                enable_macro_history = true,
                                content_spec_column = false,
                                on_select = {
                                        move_to_front = false,
                                        close_telescope = true,
                                },
                                on_paste = {
                                        set_reg = false,
                                        move_to_front = false,
                                        close_telescope = true,
                                },
                                on_replay = {
                                        set_reg = false,
                                        move_to_front = false,
                                        close_telescope = true,
                                },
                                on_custom_action = {
                                        close_telescope = true,
                                },
                                keys = {
                                        telescope = {
                                                i = {
                                                        select = '<cr>',
                                                        paste = '<c-p>',
                                                        paste_behind = '<c-k>',
                                                        replay = '<c-q>',
                                                        delete = '<c-d>',
                                                        edit = '<c-e>',
                                                        custom = {},
                                                },
                                                n = {
                                                        select = '<cr>',
                                                        paste = 'p',
                                                        paste_behind = 'P',
                                                        replay = 'q',
                                                        delete = 'd',
                                                        edit = 'e',
                                                        custom = {},
                                                },
                                        },
                                },
                        })
                end,
        },

        -- 剪切板历史查看器
        {
                "nvim-telescope/telescope.nvim",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                },
                config = function()
                        require("telescope").setup({
                                extensions = {
                                        neoclip = {
                                                default_register = '"',
                                        },
                                },
                        })
                        require("telescope").load_extension("neoclip")
                end,
        },

        -- 备用剪贴板解决方案
        {
                "ibhagwan/smartyank.nvim",
                event = "TextYankPost",
                config = function()
                        require("smartyank").setup({
                                highlight = {
                                        enabled = true, -- highlight yanked text
                                        higroup = "IncSearch", -- highlight group of yanked text
                                        timeout = 2000, -- timeout for clearing the highlight
                                },
                                clipboard = {
                                        enabled = true,
                                        -- 如果没有外部剪贴板工具，使用内置方法
                                        backend = "auto", -- "auto", "pbcopy", "xclip", "xsel", "wl-copy"
                                },
                                tmux = {
                                        enabled = false,
                                },
                                osc52 = {
                                        enabled = true,
                                        ssh_only = false, -- 只在 SSH 会话中启用
                                        silent = false,
                                        echo_hl = "Directory",
                                },
                        })
                end,
        },
}
