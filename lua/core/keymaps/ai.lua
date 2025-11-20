local keymap = vim.keymap

-- === AI 代码助手快捷键 ===

-- OpenCode AI 助手
keymap.set({ "n", "x" }, "<leader>aa", function() require("opencode").ask("@this: ", { submit = true }) end,
    { desc = "Ask opencode" })
keymap.set({ "n", "x" }, "<leader>as", function() require("opencode").select() end,
    { desc = "Execute opencode action…" })
keymap.set({ "n", "x" }, "<leader>ap", function() require("opencode").prompt("@this") end,
    { desc = "Add to opencode" })
keymap.set({ "n", "t" }, "<leader>at", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
keymap.set("n", "<leader>au", function() require("opencode").command("session.half.page.up") end,
    { desc = "opencode half page up" })
keymap.set("n", "<leader>ad", function() require("opencode").command("session.half.page.down") end,
    { desc = "opencode half page down" })
