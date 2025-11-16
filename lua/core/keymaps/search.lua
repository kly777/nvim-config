local keymap = vim.keymap

-- === 文件搜索快捷键 (Telescope) ===

-- 搜索文件
keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "搜索文件" })

-- 实时搜索文件内容
keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "搜索文件内容" })

-- 搜索缓冲区
keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "搜索缓冲区" })

-- 搜索帮助文档
keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "搜索帮助文档" })

-- 搜索最近文件
keymap.set("n", "<leader>fr", function()
  require("telescope.builtin").oldfiles()
end, { desc = "搜索最近文件" })

-- 搜索当前缓冲区内容
keymap.set("n", "<leader>fs", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "搜索当前缓冲区" })

-- 搜索 git 文件
keymap.set("n", "<leader>gf", function()
  require("telescope.builtin").git_files()
end, { desc = "搜索 Git 文件" })

-- 搜索 git 提交
keymap.set("n", "<leader>gc", function()
  require("telescope.builtin").git_commits()
end, { desc = "搜索 Git 提交" })

