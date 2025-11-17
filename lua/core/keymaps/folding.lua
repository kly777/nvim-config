local keymap = vim.keymap

-- === 文件大纲快捷键 (Aerial) ===

-- 切换大纲
keymap.set("n", "<leader>o", function()
    require("aerial").toggle()
end, { desc = "切换文件大纲" })

-- 打开大纲
keymap.set("n", "<leader>O", function()
    require("aerial").open()
end, { desc = "打开文件大纲" })

-- 关闭大纲
keymap.set("n", "<leader>oc", function()
    require("aerial").close()
end, { desc = "关闭文件大纲" })

-- 导航大纲
keymap.set("n", "[[", function()
    require("aerial").prev()
end, { desc = "上一个符号" })

keymap.set("n", "]]", function()
    require("aerial").next()
end, { desc = "下一个符号" })

-- 跳转到符号
keymap.set("n", "<leader>os", function()
    require("aerial").select()
end, { desc = "选择符号" })

-- 大纲搜索
keymap.set("n", "<leader>of", function()
    require("telescope").extensions.aerial.aerial()
end, { desc = "搜索符号" })
