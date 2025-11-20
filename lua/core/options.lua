local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true


-- 缩进配置
opt.tabstop = 4        -- 制表符宽度为 4 个空格
opt.shiftwidth = 4     -- 自动缩进时每级缩进 4 个空格
opt.expandtab = true   -- 将制表符转换为空格
opt.softtabstop = 4    -- 在插入模式下按 Tab 键插入 4 个空格
opt.smartindent = true -- 智能缩进
opt.autoindent = true  -- 自动缩进

-- 换行配置
opt.wrap = false -- 不自动换行

-- 光标配置
opt.cursorline = true -- 高亮当前行

-- 鼠标支持
opt.mouse:append("a") -- 在所有模式下启用鼠标

-- 剪贴板配置
opt.clipboard:append("unnamedplus") -- 使用系统剪贴板

-- 搜索配置
opt.ignorecase = true  -- 搜索时忽略大小写
opt.smartcase = true   -- 如果搜索包含大写字母，则区分大小写

-- 界面配置
opt.termguicolors = true -- 启用真彩色支持
opt.signcolumn = "yes"   -- 总是显示标记列

-- Shell 配置
opt.shell = "pwsh"                                                             -- 设置默认 shell 为 PowerShell
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command" -- PowerShell 参数
opt.shellquote = ""                                                            -- 引号设置
opt.shellxquote = ""                                                           -- 外部引号设置

-- 插件相关配置
opt.autoread = true                                          -- 自动重新加载外部修改的文件 (opencode.nvim 要求)
opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim") -- 添加 lazy.nvim 到运行时路径

-- 状态栏配置 (原生neovim状态栏)
opt.laststatus = 2  -- 总是显示状态栏
opt.ruler = true    -- 显示光标位置
opt.showmode = true -- 显示当前模式

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
