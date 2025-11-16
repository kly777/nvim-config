local keymap = vim.keymap

-- === 剪切板快捷键 ===

-- 系统剪切板操作
keymap.set("v", "<leader>y", '"+y', { desc = "复制到系统剪切板" })
keymap.set("n", "<leader>Y", '"+Y', { desc = "复制行到系统剪切板" })
keymap.set("v", "<leader>p", '"+p', { desc = "从系统剪切板粘贴" })
keymap.set("n", "<leader>p", '"+p', { desc = "从系统剪切板粘贴" })

-- 剪切板历史
keymap.set("n", "<leader>sy", function()
  require("telescope").extensions.neoclip.default()
end, { desc = "查看剪切板历史" })

-- 系统剪切板集成（osc52）
keymap.set("v", "<leader>cy", function()
  if package.loaded["osc52"] then
    require("osc52").copy_visual()
  else
    vim.fn.setreg('+', vim.fn.getreg('"'))
  end
end, { desc = "复制到系统剪切板（osc52）" })

keymap.set("n", "<leader>cY", function()
  if package.loaded["osc52"] then
    require("osc52").copy_operator()
  else
    vim.fn.setreg('+', vim.fn.getreg('"'))
  end
end, { desc = "复制操作到系统剪切板（osc52）" })

