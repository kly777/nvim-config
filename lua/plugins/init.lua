-- 主插件配置文件

return {
        -- 导入高亮方案配置
        { import = "plugins.configs.colorscheme" },

        -- 导入文件树配置
        { import = "plugins.configs.filetree" },

        -- 导入 LSP 配置
        { import = "plugins.configs.lsp" },

        -- 导入自动补全配置
        { import = "plugins.configs.completion" },

        -- 导入 AI 助手配置
        { import = "plugins.configs.ai" },

        -- 导入工具插件配置
        { import = "plugins.configs.tools" },

        -- 导入文件搜索配置
        { import = "plugins.configs.telescope" },

        -- 导入 Git 状态显示配置
        { import = "plugins.configs.gitsigns" },

        -- 导入缩进可视化配置
        { import = "plugins.configs.indent" },

}
