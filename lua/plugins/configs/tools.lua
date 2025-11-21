return {
    -- 系统剪切板集成 (主要解决方案)
    {
        "ojroques/nvim-osc52",
        config = function()
            require("osc52").setup({
                max_length = 0, -- 禁用最大长度限制
                silent = false, -- 禁用静默模式
                trim = false,   -- 禁用修剪
            })

            -- 设置复制到系统剪切板的快捷键
            -- 注意：剪切板快捷键已移至 core.keymaps.clipboard
        end,
    },
}
