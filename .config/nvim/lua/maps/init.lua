local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Search
map('n', '<SPACE>', '/')

-- Disable highlight when <leader><cr> is pressed
map('n', '<Leader><CR>', ':noh<CR><ESC>', {silent = true})

-- Quick save
map('n', '<Leader>w', ':w<CR>')

-- Close current buffer
map('n', '<Leader>x', ':BD<CR>')

-- Smart way to move between windows
map('n', '<Leader><Down>', '<C-W><C-J>', { silent = true })
map('n', '<Leader><Up>', '<C-W><C-K>', { silent = true })
map('n', '<Leader><Right>', '<C-W><C-L>', { silent = true })
map('n', '<Leader><Left>', '<C-W><C-H>', { silent = true })
map('n', '<Leader>;', '<C-W>R', { silent = true })
map('n', '<Leader>[', '<C-W>_', { silent = true })
map('n', '<Leader>]', '<C-W>|', { silent = true })
map('n', '<Leader>=', '<C-W>=', { silent = true })
