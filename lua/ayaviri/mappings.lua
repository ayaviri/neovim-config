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
mapper("n", "<leader>nl", ":nohl<CR>")
mapper("n", "<leader-v>", "<C-v>") -- changing visual block mode keybinding

-- terminal mode
mapper("t", "jj", "<C-\\><C-n>")

-- buffer management
mapper("n", "<leader>op", ":%bd|e#<CR>") -- deletes all buffers, opens last one for editing  (deletes all buffers except current one)

-- split navigation
mapper("n", "<leader>h", "<C-w>h")
mapper("n", "<leader>l", "<C-w>l")
mapper("n", "<leader>j", "<C-w>j")
mapper("n", "<leader>k", "<C-w>k")

-- split resizing
-- TODO: put split size diff in variable and use format strings to inject
mapper("n", "<leader>sj", ":horizontal resize -5<CR>")
mapper("n", "<leader>sk", ":horizontal resize +5<CR>")
mapper("n", "<leader>sh", ":vertical resize +5<CR>")
mapper("n", "<leader>sl", ":vertical resize -5<CR>")

-- tab navigation
mapper("n", "<leader>t", ":tabnew<CR>")
mapper("n", "<leader>w", ":tabclose<CR>")
mapper("n", "<leader><S-l>", ":tabnext<CR>")
mapper("n", "<leader><S-h>", ":tabprevious<CR>")

-- markdown-preview
mapper("n", "<leader>mp", ":MarkdownPreview<CR>")

-- vim-maximizer
mapper("n", "<leader>m", ":MaximizerToggle<CR>")

-- openingh
mapper("n", "<leader>gr", ":OpenInGHRepo<CR>")
mapper("n", "<leader>gf", ":OpenInGHFile<CR>")
mapper("v", "<leader>gf", ":OpenInGHFileLines<CR>")

-- figlet.nvim
mapper("n", "<leader>i", ":Fig ")

-- no-neck-pain
mapper("n", "<leader>n", ":NoNeckPain<CR>")
