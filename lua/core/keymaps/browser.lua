local keymap = vim.keymap

-- === 网页链接打开快捷键 ===

-- 使用 gx 打开光标下的链接 (兼容 Windows)
keymap.set("n", "gx", function()
        local url = vim.fn.expand("<cWORD>")
        -- 检查是否为 URL
        if string.match(url, "https?://") then
                -- Windows 系统使用 start 命令打开默认浏览器
                if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
                        vim.fn.system("start " .. vim.fn.shellescape(url))
                else
                        -- Linux/macOS 使用 xdg-open/open 命令
                        vim.fn.system("xdg-open " .. vim.fn.shellescape(url))
                end
        else
                print("未检测到有效的 URL")
        end
end, { desc = "打开光标下的链接" })

-- 在可视模式下打开选中的链接
keymap.set("v", "gx", function()
        local selected_text = vim.fn.getreg('"')
        if string.match(selected_text, "https?://") then
                if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
                        vim.fn.system("start " .. vim.fn.shellescape(selected_text))
                else
                        vim.fn.system("xdg-open " .. vim.fn.shellescape(selected_text))
                end
        else
                print("未检测到有效的 URL")
        end
end, { desc = "打开选中的链接" })

-- 使用 leader 快捷键打开当前文件的 URL 列表
keymap.set("n", "<leader>bu", function()
        -- 使用 urlview 插件查看当前文件中的所有 URL
        vim.cmd("UrlView")
end, { desc = "查看文件中的 URL 列表" })

-- 使用 leader 快捷键搜索当前文件中的 URL
keymap.set("n", "<leader>bs", function()
        -- 搜索当前文件中的 HTTP/HTTPS URL
        vim.cmd("/https\\?://[^\\s]\\+")
end, { desc = "搜索文件中的 URL" })

-- 打开浏览器搜索选中的文本
keymap.set("v", "<leader>bs", function()
        local selected_text = vim.fn.getreg('"')
        local search_url = "https://www.google.com/search?q=" .. vim.fn.escape(selected_text, " ")
        if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
                vim.fn.system("start " .. vim.fn.shellescape(search_url))
        else
                vim.fn.system("xdg-open " .. vim.fn.shellescape(search_url))
        end
end, { desc = "在浏览器中搜索选中的文本" })
