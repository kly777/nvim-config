local vim = vim
local opt = vim.opt

-- 搜索配置
opt.ignorecase = true    -- 搜索时忽略大小写
opt.smartcase = true     -- 如果搜索包含大写字母，则区分大小写
opt.hlsearch = true      -- 高亮搜索结果
opt.incsearch = true     -- 增量搜索
opt.inccommand = "split" -- 实时预览替换效果

