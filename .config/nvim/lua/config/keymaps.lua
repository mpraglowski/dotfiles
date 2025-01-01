-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Search
map("n", "<SPACE>", "/")

-- Disable highlight when <leader><cr> is pressed
map("n", "<Leader><CR>", ":noh<CR><ESC>", { silent = true })

-- Quick save
map("n", "<Leader>w", ":w<CR>")

-- Close current buffer
map("n", "<leader>Q", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Smart way to move between windows
map("n", "<Leader><Down>", "<C-W><C-J>", { silent = true })
map("n", "<Leader><Up>", "<C-W><C-K>", { silent = true })
map("n", "<Leader><Right>", "<C-W><C-L>", { silent = true })
map("n", "<Leader><Left>", "<C-W><C-H>", { silent = true })
map("n", "<Leader>;", "<C-W>R", { silent = true })
map("n", "<Leader>[", "<C-W>_", { silent = true })
map("n", "<Leader>]", "<C-W>|", { silent = true })
map("n", "<Leader>=", "<C-W>=", { silent = true })
