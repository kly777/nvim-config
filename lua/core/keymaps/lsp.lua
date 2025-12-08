local keymap = vim.keymap

-- === LSP 快捷键 ===

-- 代码导航
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "跳转到定义" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "跳转到声明" })
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "查看引用" })
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "跳转到实现" })
keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "跳转到类型定义" })


-- 代码信息
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "显示悬停文档" })



-- 代码操作
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "重命名符号" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "代码操作" })

-- 代码格式化
keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
end, { desc = "格式化代码" })


-- 诊断信息
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "显示诊断信息" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "上一个诊断" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "下一个诊断" })

-- 快速修复
keymap.set("n", "<leader>qf", vim.diagnostic.setqflist, { desc = "打开快速修复列表" })
keymap.set("n", "<leader>ql", vim.diagnostic.setloclist, { desc = "打开位置列表" })

-- 切换内联提示（TypeScript等语言支持）
keymap.set("n", "<leader>ih", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "切换内联提示" })
