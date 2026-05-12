-- ============================================================================
-- Neovim Config Entry Point
-- ============================================================================
-- Modules are loaded in dependency order.
-- Options (colorscheme, transparency, vim.opt, shell) must load first.
-- Augroup must exist before LSP and Terminal use it.

require("config.options")
require("config.statusline")
require("config.keymaps")
require("config.autocmds")
require("config.plugins")
require("config.lsp")
require("config.terminal")
