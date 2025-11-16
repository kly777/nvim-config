vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- === 基础快捷键 ===

-- 插入模式退出到普通模式
keymap.set("i", "jk", "<ESC>", { desc = "退出插入模式" })

-- 标签页导航
keymap.set("n", "<TAB>", ":bn<CR>", { desc = "下一个缓冲区" })
keymap.set("n", "<S-TAB>", ":bp<CR>", { desc = "上一个缓冲区" })

-- === 文件树快捷键 ===

-- 切换文件树显示/隐藏
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "切换文件树" })

-- === LSP 快捷键 ===

-- 代码导航
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "跳转到定义" })
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "跳转到声明" })
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "查看引用" })
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "跳转到实现" })

-- 代码信息
keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "显示悬停文档" })

-- 代码操作
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "重命名符号" })
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "代码操作" })

-- 代码格式化
keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "格式化代码" })

-- 诊断信息
keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "显示诊断信息" })
keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "上一个诊断" })
keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "下一个诊断" })

-- === 剪切板快捷键 ===

-- 系统剪切板操作
keymap.set("v", "<leader>y", '"+y', { desc = "复制到系统剪切板" })
keymap.set("n", "<leader>Y", '"+Y', { desc = "复制行到系统剪切板" })
keymap.set("v", "<leader>p", '"+p', { desc = "从系统剪切板粘贴" })
keymap.set("n", "<leader>p", '"+p', { desc = "从系统剪切板粘贴" })

-- 剪切板历史
keymap.set("n", "<leader>sy", "<cmd>Telescope neoclip<CR>", { desc = "查看剪切板历史" })

-- 系统剪切板集成（osc52）
keymap.set("v", "<leader>cy", require("osc52").copy_visual, { desc = "复制到系统剪切板（osc52）" })
keymap.set("n", "<leader>cY", require("osc52").copy_operator, { desc = "复制操作到系统剪切板（osc52）" })
