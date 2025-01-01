-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","

local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local opt = vim.opt -- to set options

-- System
opt.swapfile = false -- Skip swap file
opt.backup = false
opt.title = true
opt.shell = "fish"
opt.termguicolors = true -- True color support
opt.lazyredraw = true

-- Unknown
opt.updatetime = 250
opt.inccommand = "split"
opt.pumblend = 5
vim.wo.signcolumn = "yes"

-- Options
opt.list = false -- Show some invisible characters
opt.linebreak = true -- Stop words being broken on wrap
opt.wrap = false -- No line wrap

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

-- Cursor
opt.cursorline = true

cmd([[augroup BgHighlight]])
cmd([[autocmd!]])
cmd([[autocmd WinEnter * set cursorline]])
cmd([[autocmd WinLeave * set nocursorline]])
cmd([[augroup END]])

cmd([[set clipboard+=unnamedplus]]) -- Use OSX clipboard to copy and to paste
