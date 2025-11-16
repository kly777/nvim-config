local keymap = vim.keymap

-- === 文件树快捷键 ===

-- 切换文件树显示/隐藏
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "切换文件树" })

-- 文件树查找文件
keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>", { desc = "在文件树中定位当前文件" })

