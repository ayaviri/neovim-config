-- essentials
vim.g.mapleader = " "

require("ayaviri")

-- behavior
vim.opt.grepprg = "rg --vimgrep --smart-case --no-heading" -- search with rg

-- indentation
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true -- continue indentation to new line

-- look and feel
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999 -- padding between cursor and top/bottom of window
vim.opt.splitright = true -- prefer vsplitting to the right
vim.opt.splitbelow = true -- prefer svsplitting down
vim.opt.wrap = false -- don't wrap my text
vim.cmd [[colorscheme desert]]

-- searching
vim.opt.wildmenu = true -- tab complete on command line
vim.opt.ignorecase = true -- case insensitive search...
vim.opt.smartcase = true -- unless i use caps
vim.opt.hlsearch = true -- highlight matching text
vim.opt.incsearch = true -- update results while i type

