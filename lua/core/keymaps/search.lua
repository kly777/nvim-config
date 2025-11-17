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

-- 搜索 git 状态（修改的文件）
keymap.set("n", "<leader>gs", function()
    require("telescope.builtin").git_status()
end, { desc = "查看 Git 状态" })

-- 搜索 git 分支
keymap.set("n", "<leader>gb", function()
    require("telescope.builtin").git_branches()
end, { desc = "查看 Git 分支" })

-- 搜索 git stash
keymap.set("n", "<leader>gt", function()
    require("telescope.builtin").git_stash()
end, { desc = "查看 Git Stash" })

-- 搜索诊断信息
keymap.set("n", "<leader>fd", function()
    require("telescope.builtin").diagnostics()
end, { desc = "搜索诊断信息" })

-- 自定义布局搜索文件
keymap.set("n", "<leader>fc", function()
    require("telescope.builtin").find_files({
        layout_strategy = "flex",
        layout_config = {
            flex = {
                flip_columns = 120,
            },
            horizontal = {
                preview_width = 0.6,
                prompt_position = "bottom",
            },
        },
    })
end, { desc = "自定义布局搜索文件" })
