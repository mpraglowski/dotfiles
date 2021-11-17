local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local opt = vim.opt  -- to set options

cmd [[set noswapfile]] -- Skip swap file

-- Options
opt.list = false -- Show some invisible characters
opt.linebreak = true -- Stop words being broken on wrap

-- Line numbers
opt.number = true -- Show line numbers

-- Scroll
opt.scrolloff = 5 -- Lines above scroll

-- Smart Case
opt.ignorecase = true
opt.smartcase = true

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true
opt.autoindent = true

-- Split panes position
opt.splitbelow = true
opt.splitright = true
