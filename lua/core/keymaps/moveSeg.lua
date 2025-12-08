local keymap = vim.keymap

-- 在可视模式下移动选中的代码段
keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", { desc = "向下移动选中代码段" })
keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", { desc = "向上移动选中代码段" })
