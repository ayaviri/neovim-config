local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
vim.keymap.set('n', '<leader><S-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader><S-f>', builtin.live_grep, {})
-- consider replacing this with LSP once that has been setup
vim.keymap.set('n', '<leader>*', builtin.grep_string, {}) 
vim.keymap.set('n', '<leader>ls', builtin.buffers, {})
-- these are relative to the currently open buffer
vim.keymap.set(
    'n', 
    '<leader>p', 
    function()
        return builtin.find_files({cwd=utils.buffer_dir()})
    end,
    {}
)
vim.keymap.set(
    'n', 
    '<leader>f', 
    function()
        return builtin.live_grep({cwd=utils.buffer_dir()})
    end,
    {}
)
vim.keymap.set("n", "<leader>ht", builtin.help_tags, {})
vim.keymap.set("n", "<leader>lp", builtin.resume, {})

-- lsp stuff
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>re", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>ic", builtin.lsp_incoming_calls, {})
