local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true


-- 缩进配置
opt.tabstop = 4          -- 制表符宽度为 2 个空格
opt.shiftwidth = 4       -- 自动缩进时每级缩进 2 个空格
opt.expandtab = true     -- 将制表符转换为空格
opt.softtabstop = 4      -- 在插入模式下按 Tab 键插入 2 个空格
opt.smartindent = true   -- 智能缩进
opt.autoindent = true    -- 自动缩进

-- 换行配置
opt.wrap = false         -- 不自动换行

-- 光标配置
opt.cursorline = true    -- 高亮当前行

--
opt.mouse:append("a")

opt.clipboard:append("unnamedplus")

--
opt.ignorecase = true
opt.smartcase = true

--
opt.termguicolors = true
opt.signcolumn = "yes"
-- Shell 配置
opt.shell = "pwsh"                                                          -- 设置默认 shell 为 PowerShell
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"    -- PowerShell 参数
opt.shellquote = ""                                                               -- 引号设置
opt.shellxquote = ""                                                              -- 外部引号设置
