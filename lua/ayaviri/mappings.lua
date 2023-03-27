-- mapping helper
---@param mode string
---@param key string
---@param result function | string
local mapper = function(mode, key, result) vim.keymap.set(mode, key, result, { noremap = true, silent = true }) end

-- essentials
mapper("i", "jj", "<Esc>")
mapper("v", "<leader>c", "\"*y")

-- leader mappings
mapper("n", "<leader>b", vim.cmd.Ex) -- open file explorer
mapper("n", "<leader>a", "gg<S-v>G")

-- split navigation
mapper("n", "<leader>h", "<C-w>h")
mapper("n", "<leader>l", "<C-w>l")
mapper("n", "<leader>j", "<C-w>j")
mapper("n", "<leader>k", "<C-w>k")

