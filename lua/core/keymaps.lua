vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 加载所有模块化的快捷键配置
require("core.keymaps.navigation")
require("core.keymaps.search")
require("core.keymaps.filetree")
require("core.keymaps.lsp")
require("core.keymaps.clipboard")
require("core.keymaps.ai")
