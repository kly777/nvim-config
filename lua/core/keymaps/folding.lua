local keymap = vim.keymap


-- === 符号导航快捷键 ===

-- 使用 Telescope 搜索文档符号
keymap.set("n", "<leader>o", function()
        local params = vim.lsp.util.make_position_params(0, nil)
        require("telescope.builtin").lsp_document_symbols({
                -- 可以传递额外的参数
        })
end, { desc = "搜索文档符号" })


-- 内置折叠快捷键
keymap.set("n", "zc", "zc", { desc = "折叠当前区域" })
keymap.set("n", "zo", "zo", { desc = "展开当前区域" })
keymap.set("n", "zR", "zR", { desc = "展开所有折叠" })
keymap.set("n", "zM", "zM", { desc = "折叠所有区域" })
