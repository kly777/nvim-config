return {
    -- 系统剪切板集成 (主要解决方案)
    {
        "ojroques/nvim-osc52",
        config = function()
            require("osc52").setup({
                max_length = 0,                 -- 禁用最大长度限制
                silent = false,                 -- 禁用静默模式
                trim = false,                   -- 禁用修剪
            })

            -- 设置复制到系统剪切板的快捷键
            -- 注意：剪切板快捷键已移至 core.keymaps.clipboard
        end,
    },


    -- 备用剪贴板解决方案
    {
        "ibhagwan/smartyank.nvim",
        event = "TextYankPost",
        config = function()
            require("smartyank").setup({
                highlight = {
                    enabled = true,                            -- highlight yanked text
                    higroup = "IncSearch",                     -- highlight group of yanked text
                    timeout = 2000,                            -- timeout for clearing the highlight
                },
                clipboard = {
                    enabled = true,
                    -- 如果没有外部剪贴板工具，使用内置方法
                    backend = "auto",                     -- "auto", "pbcopy", "xclip", "xsel", "wl-copy"
                },
                tmux = {
                    enabled = false,
                },
                osc52 = {
                    enabled = true,
                    ssh_only = false,                     -- 只在 SSH 会话中启用
                    silent = false,
                    echo_hl = "Directory",
                },
            })
        end,
    },
}
