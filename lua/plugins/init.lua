return {
  -- 高亮方案
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        -- 可选配置，使用默认设置
        style = "night", -- 可选: storm, night, day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
      })
      -- 设置默认高亮方案
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- 文件树插件
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },

  -- 文件图标支持
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- LSP 配置
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  -- Mason - LSP 管理器
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        -- Lua
        "lua_ls",
        -- Python
        "pyright",
        -- JavaScript/TypeScript
        "tsserver",
        -- Go
        "gopls",
        -- Rust
        "rust_analyzer",
        -- C/C++
        "clangd",
        -- Java
        "jdtls",
        -- HTML/CSS/JSON
        "html",
        "cssls",
        "jsonls",
        -- Markdown
        "marksman",
        -- Shell
        "bashls",
        -- Docker
        "dockerls",
        -- YAML
        "yamlls",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },

  -- Mason LSP 配置
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  -- 自动补全
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- 括号自动补全
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- 使用 treesitter 检查
        ts_config = {
          lua = { "string" }, -- 在 lua 中不补全字符串
          javascript = { "template_string" },
          java = false, -- 不在 java 中启用
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = [=[[%'%"%>%]%)%}%,]]=],
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "Search",
          highlight_grey = "Comment",
        },
      })

      -- 与 cmp 集成
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- LSP 增强 UI
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
      })
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- LSP 进度显示
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = function()
      require("fidget").setup({})
    end,
  },

  -- 剪切板管理
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neoclip").setup({
        history = 1000,
        enable_persistent_history = true,
        continuous_sync = true,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        filter = nil,
        preview = true,
        prompt = nil,
        default_register = '"',
        default_register_macros = 'q',
        enable_macro_history = true,
        content_spec_column = false,
        on_select = {
          move_to_front = false,
          close_telescope = true,
        },
        on_paste = {
          set_reg = false,
          move_to_front = false,
          close_telescope = true,
        },
        on_replay = {
          set_reg = false,
          move_to_front = false,
          close_telescope = true,
        },
        on_custom_action = {
          close_telescope = true,
        },
        keys = {
          telescope = {
            i = {
              select = '<cr>',
              paste = '<c-p>',
              paste_behind = '<c-k>',
              replay = '<c-q>',
              delete = '<c-d>',
              edit = '<c-e>',
              custom = {},
            },
            n = {
              select = '<cr>',
              paste = 'p',
              paste_behind = 'P',
              replay = 'q',
              delete = 'd',
              edit = 'e',
              custom = {},
            },
          },
        },
      })
    end,
  },

  -- 系统剪切板集成
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup({
        max_length = 0, -- 禁用最大长度限制
        silent = false, -- 禁用静默模式
        trim = false,   -- 禁用修剪
      })

      -- 设置复制到系统剪切板的快捷键
      vim.keymap.set("v", "<leader>y", require("osc52").copy_visual, { desc = "复制到系统剪切板" })
      vim.keymap.set("n", "<leader>Y", require("osc52").copy_operator, { desc = "复制操作到系统剪切板" })
    end,
  },

  -- 剪切板历史查看器
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          neoclip = {
            default_register = '"',
          },
        },
      })
      require("telescope").load_extension("neoclip")
    end,
  },

  -- === AI 代码助手 ===

  -- Avante.nvim - 现代化的 AI 代码助手
  {
    "avante-nvim/avante.nvim",
    event = "VeryLazy",
    build = ":UpdateRemotePlugins",
    config = function()
      require("avante").setup({
        -- 基础配置
        enabled = true,
        auto_start = true,
        
        -- 模型配置
        model = {
          provider = "openai", -- 可选: openai, anthropic, local
          name = "gpt-4",      -- 模型名称
          temperature = 0.7,
          max_tokens = 2048,
        },
        
        -- UI 配置
        ui = {
          border = "rounded",
          width = 0.8,
          height = 0.8,
          position = "50%",
        },
        
        -- 功能配置
        features = {
          code_completion = true,
          chat = true,
          code_actions = true,
          documentation = true,
          refactoring = true,
        },
        
        -- 快捷键配置
        keymaps = {
          toggle_chat = "<leader>ac",
          complete_code = "<leader>aa",
          explain_code = "<leader>ae",
          refactor_code = "<leader>ar",
          fix_issues = "<leader>af",
        },
        
        -- 语言特定配置
        languages = {
          lua = {
            enabled = true,
            style_guide = "strict",
          },
          python = {
            enabled = true,
            style_guide = "pep8",
          },
          javascript = {
            enabled = true,
            style_guide = "standard",
          },
          typescript = {
            enabled = true,
            style_guide = "strict",
          },
          rust = {
            enabled = true,
            style_guide = "rustfmt",
          },
          go = {
            enabled = true,
            style_guide = "gofmt",
          },
        },
        
        -- 高级配置
        advanced = {
          cache_enabled = true,
          cache_size = 1000,
          context_window = 4096,
          streaming = true,
        }
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}