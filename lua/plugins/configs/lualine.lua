return {
  -- 现代化状态栏插件
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- 文件图标支持
    },
    config = function()
      local lualine = require("lualine")

      -- 自定义颜色
      local colors = {
        blue   = "#80a0ff",
        cyan   = "#79dac8",
        black  = "#080808",
        white  = "#c6c6c6",
        red    = "#ff5189",
        violet = "#d183e8",
        grey   = "#303030",
      }

      lualine.setup({
        options = {
          theme = "auto", -- 自动匹配颜色主题
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "NvimTree", "alpha" },
          },
          globalstatus = true, -- 全局状态栏
        },
        sections = {
          lualine_a = {
            {
              "mode",
              separator = { left = "", right = "" },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_b = {
            {
              "branch",
              icon = "",
              color = { fg = colors.violet, gui = "bold" },
            },
            {
              "diff",
              symbols = {
                added = " ",
                modified = " ",
                removed = " ",
              },
              diff_color = {
                added = { fg = colors.cyan },
                modified = { fg = colors.blue },
                removed = { fg = colors.red },
              },
            },
          },
          lualine_c = {
            {
              "filename",
              path = 1, -- 显示相对路径
              symbols = {
                modified = " ●", -- 修改状态
                readonly = " ", -- 只读状态
                unnamed = "[未命名]", -- 未命名文件
              },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
              },
            },
            "encoding",
            {
              "fileformat",
              symbols = {
                unix = "", -- LF
                dos = "",   -- CRLF
                mac = "",   -- CR
              },
            },
            "filetype",
          },
          lualine_y = {
            "progress",
          },
          lualine_z = {
            {
              "location",
              separator = { left = "", right = "" },
              padding = { left = 1, right = 1 },
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            {
              "tabs",
              mode = 2,
              tabs_color = {
                active = "lualine_a_normal",
                inactive = "lualine_a_inactive",
              },
            },
          },
        },
        extensions = { "nvim-tree", "toggleterm", "fugitive" },
      })
    end,
  },
}

