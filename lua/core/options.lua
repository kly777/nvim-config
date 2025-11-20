-- 主选项配置文件
-- 导入拆分的配置模块

-- 基础配置
require("core.options.basic")

-- 界面配置
require("core.options.interface")

-- 搜索配置
require("core.options.search")

local opt = vim.opt

-- 鼠标支持
opt.mouse:append("a") -- 在所有模式下启用鼠标

-- 剪贴板配置
opt.clipboard:append("unnamedplus") -- 使用系统剪贴板

-- Shell 配置
opt.shell = "pwsh"                                                             -- 设置默认 shell 为 PowerShell
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command" -- PowerShell 参数
opt.shellquote = ""                                                            -- 引号设置
opt.shellxquote = ""                                                           -- 外部引号设置

-- 插件相关配置
opt.autoread = true                                          -- 自动重新加载外部修改的文件 (opencode.nvim 要求)
opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim") -- 添加 lazy.nvim 到运行时路径

-- 文件编码和格式
opt.encoding = "utf-8"     -- 设置文件编码为 UTF-8
opt.fileencoding = "utf-8" -- 设置文件写入编码
opt.fileformat = "unix"    -- 使用 Unix 换行符

-- 界面优化
opt.scrolloff = 8     -- 光标距离顶部/底部保留8行
opt.sidescrolloff = 8 -- 光标距离左右边缘保留8列
opt.showmatch = true  -- 显示匹配的括号
opt.matchtime = 2     -- 匹配括号高亮时间（0.2秒）

-- 编辑体验
opt.undofile = true                             -- 启用持久撤销
opt.undodir = vim.fn.stdpath("data") .. "/undo" -- 撤销文件目录
opt.backup = false                              -- 禁用备份文件
opt.swapfile = false                            -- 禁用交换文件
opt.writebackup = false                         -- 禁用写入备份

-- 性能优化
opt.lazyredraw = true -- 延迟重绘，提升性能
opt.updatetime = 300  -- 更新时间间隔（毫秒）
opt.timeoutlen = 500  -- 按键超时时间
