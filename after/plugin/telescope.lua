local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>p', function() builtin.find_files({ hidden=true }) end)
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader><S-f>', builtin.live_grep, {})
