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

-- 状态栏配置 (原生neovim状态栏)
opt.laststatus = 2        -- 总是显示状态栏
opt.ruler = true          -- 显示光标位置
opt.showmode = true       -- 显示当前模式

-- 自定义状态栏格式
opt.statusline = [[%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P]]
-- 状态栏格式说明:
-- %<  : 如果状态栏太长，从这里开始截断
-- %f  : 文件名
-- %h  : 帮助文件标志
-- %m  : 修改标志
-- %r  : 只读标志
-- %=  : 左右分界点
-- %-14.(...) : 最小宽度14字符的内容
-- %l  : 当前行号
-- %c  : 当前列号
-- %V  : 虚拟列号
-- %P  : 文件位置百分比

-- 可选的其他状态栏配置示例:
-- 简洁版本: opt.statusline = [[%f %m %= %l:%c]]
-- 详细信息版本: opt.statusline = [[%<%f\ %h%m%r%w\ %y\ [%{&ff}]\ [%{&enc}]\ %=%-14.(%l,%c%V%)\ %P]]
