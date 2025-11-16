vim.g.mapleader=" "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

--
keymap.set("i","jk","<ESC>")


keymap.set("n","<TAB>",":bn<CR>")
keymap.set("n","<S-TAB>",":bp<CR>")

-- 文件树快捷键
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- LSP 快捷键
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")




