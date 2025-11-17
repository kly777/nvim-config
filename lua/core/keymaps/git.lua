local keymap = vim.keymap

-- === Git 操作快捷键 (Gitsigns) ===

-- 导航到下一个/上一个变更
keymap.set("n", "]c", function()
    if vim.wo.diff then
        return "]c"
    end
    vim.schedule(function()
        require("gitsigns").next_hunk()
    end)
    return "<Ignore>"
end, { expr = true, desc = "下一个 Git 变更" })

keymap.set("n", "[c", function()
    if vim.wo.diff then
        return "[c"
    end
    vim.schedule(function()
        require("gitsigns").prev_hunk()
    end)
    return "<Ignore>"
end, { expr = true, desc = "上一个 Git 变更" })

-- 操作变更
keymap.set("n", "<leader>hs", function()
    require("gitsigns").stage_hunk()
end, { desc = "暂存当前变更" })

keymap.set("n", "<leader>hr", function()
    require("gitsigns").reset_hunk()
end, { desc = "重置当前变更" })

keymap.set("v", "<leader>hs", function()
    require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "暂存选中变更" })

keymap.set("v", "<leader>hr", function()
    require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "重置选中变更" })

-- 缓冲区操作
keymap.set("n", "<leader>hS", function()
    require("gitsigns").stage_buffer()
end, { desc = "暂存整个缓冲区" })

keymap.set("n", "<leader>hu", function()
    require("gitsigns").undo_stage_hunk()
end, { desc = "撤销暂存" })

keymap.set("n", "<leader>hR", function()
    require("gitsigns").reset_buffer()
end, { desc = "重置整个缓冲区" })

-- 预览变更
keymap.set("n", "<leader>hp", function()
    require("gitsigns").preview_hunk()
end, { desc = "预览变更" })

keymap.set("n", "<leader>hb", function()
    require("gitsigns").blame_line({ full = true })
end, { desc = "显示当前行 blame" })

keymap.set("n", "<leader>hd", function()
    require("gitsigns").diffthis()
end, { desc = "与索引比较" })

keymap.set("n", "<leader>hD", function()
    require("gitsigns").diffthis("~")
end, { desc = "与 HEAD 比较" })

-- 切换功能
keymap.set("n", "<leader>tb", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "切换行 blame" })

keymap.set("n", "<leader>td", function()
    require("gitsigns").toggle_deleted()
end, { desc = "切换删除显示" })

-- 文本对象
keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "选择 Git 变更块" })
