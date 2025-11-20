local keymap = vim.keymap

keymap.set('t', '<ESC>', '<C-\\><C-n>', {
    desc = 'term mode to normal',
    noremap = true,
})


keymap.set('t', '<C-[>', '<C-\\><C-n>', {
    desc = 'term mode to normal',
    noremap = true,
})
