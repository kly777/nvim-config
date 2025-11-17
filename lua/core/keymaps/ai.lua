local keymap = vim.keymap

-- === AI 代码助手快捷键 ===

-- Avante.nvim AI 助手
keymap.set("n", "<leader>ac", function()
    if package.loaded["avante"] then
        require("avante").toggle_chat()
    end
end, { desc = "切换 AI 聊天" })

keymap.set("n", "<leader>aa", function()
    if package.loaded["avante"] then
        require("avante").code_completion()
    end
end, { desc = "AI 代码补全" })

keymap.set("n", "<leader>ae", function()
    if package.loaded["avante"] then
        require("avante").explain_code()
    end
end, { desc = "AI 解释代码" })

keymap.set("n", "<leader>ar", function()
    if package.loaded["avante"] then
        require("avante").refactor_code()
    end
end, { desc = "AI 重构代码" })

keymap.set("n", "<leader>af", function()
    if package.loaded["avante"] then
        require("avante").fix_issues()
    end
end, { desc = "AI 修复问题" })
