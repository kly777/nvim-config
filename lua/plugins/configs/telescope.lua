return {
  -- 文件搜索插件 (Telescope)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- 可选依赖，用于更好的文件搜索
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<ESC>"] = actions.close,
            },
          },
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
          },
          live_grep = {
            theme = "dropdown",
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
          },
        },
      })

      -- 启用 fzf 原生排序（如果安装了）
      pcall(telescope.load_extension, "fzf")

      -- 设置快捷键
      local builtin = require("telescope.builtin")

      -- 搜索文件
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "搜索文件" })

      -- 实时搜索文件内容
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "搜索文件内容" })

      -- 搜索缓冲区
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "搜索缓冲区" })

      -- 搜索帮助文档
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "搜索帮助文档" })

      -- 搜索最近文件
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "搜索最近文件" })

      -- 搜索当前缓冲区内容
      vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "搜索当前缓冲区" })
    end,
  },
}

