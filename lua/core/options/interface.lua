local vim = vim
local opt = vim.opt

-- 界面配置
opt.termguicolors = true -- 启用真彩色支持
opt.signcolumn = "yes"   -- 总是显示标记列

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

