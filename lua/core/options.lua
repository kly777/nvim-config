local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true


--
opt.tabstop = 2
opt.expandtab = true

--
opt.wrap = false

--
opt.cursorline = true

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
opt.shell = "powershell"                                                          -- 设置默认 shell 为 PowerShell
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"    -- PowerShell 参数
opt.shellquote = ""                                                               -- 引号设置
opt.shellxquote = ""                                                              -- 外部引号设置
