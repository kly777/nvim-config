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
          layout_strategy = "flex",
          layout_config = {
            flex = {
              flip_columns = 120,
            },
            horizontal = {
              preview_width = 0.6,
              prompt_position = "bottom",
            },
            vertical = {
              width = 0.8,
              height = 0.8,
              preview_height = 0.5,
            },
          },
        },
        pickers = {
          find_files = {
            layout_config = {
              horizontal = {
                preview_width = 0.6,
                prompt_position = "bottom",
              },
            },
          },
          live_grep = {
            layout_config = {
              horizontal = {
                preview_width = 0.6,
                prompt_position = "bottom",
              },
            },
          },
          buffers = {
            layout_config = {
              horizontal = {
                preview_width = 0.6,
                prompt_position = "bottom",
              },
            },
          },
        },
      })

      -- 启用 fzf 原生排序（如果安装了）
      pcall(telescope.load_extension, "fzf")

      -- 自定义布局函数：左下搜索，左上文件列表，右边文件内容预览
      local function custom_layout()
        return {
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
        }
      end

      -- 为文件搜索设置自定义布局
      vim.keymap.set("n", "<leader>fc", function()
        require("telescope.builtin").find_files(custom_layout())
      end, { desc = "自定义布局搜索文件" })
    end,
  },
}

