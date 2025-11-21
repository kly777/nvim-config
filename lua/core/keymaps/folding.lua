local keymap = vim.keymap

-- === 符号导航快捷键 ===

-- 使用 Telescope 搜索文档符号
keymap.set("n", "<leader>o", function()
    require("telescope.builtin").lsp_document_symbols()
end, { desc = "搜索文档符号" })


-- 跳转到定义
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "跳转到定义" })

-- 查看引用
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "查看引用" })

-- 内置折叠快捷键
keymap.set("n", "zc", "zc", { desc = "折叠当前区域" })
keymap.set("n", "zo", "zo", { desc = "展开当前区域" })
keymap.set("n", "zR", "zR", { desc = "展开所有折叠" })
keymap.set("n", "zM", "zM", { desc = "折叠所有区域" })
