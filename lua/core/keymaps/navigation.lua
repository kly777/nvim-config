local keymap = vim.keymap

-- === 基础导航快捷键 ===

-- 插入模式退出到普通模式
keymap.set("i", "jk", "<ESC>", { desc = "退出插入模式" })

-- 标签页导航
keymap.set("n", "<C-Tab>", ":bn<CR>", { desc = "下一个缓冲区" })
keymap.set("n", "<C-S-Tab>", ":bp<CR>", { desc = "上一个缓冲区" })

-- 窗口导航
keymap.set("n", "<C-h>", "<C-w>h", { desc = "切换到左侧窗口" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "切换到下方窗口" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "切换到上方窗口" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "切换到右侧窗口" })

-- 窗口大小调整
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "增加窗口高度" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "减少窗口高度" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "减少窗口宽度" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "增加窗口宽度" })

