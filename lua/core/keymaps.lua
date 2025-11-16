vim.g.mapleader=" "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

--
keymap.set("i","jk","<ESC>")


keymap.set("n","<TAB>",":bn<CR>")
keymap.set("n","<S-TAB>",":bp<CR>")

-- 文件树快捷键
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")




