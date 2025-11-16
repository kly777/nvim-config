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
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          },
          live_grep = {
            theme = "dropdown",
          },
          buffers = {
            theme = "dropdown",
          },
        },
      })

      -- 启用 fzf 原生排序（如果安装了）
      pcall(telescope.load_extension, "fzf")
    end,
  },
}

