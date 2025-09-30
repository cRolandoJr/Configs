-- Neovim Configuration
-- init.lua

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Show relative line numbers
vim.opt.mouse = 'a'                -- Enable mouse support
vim.opt.ignorecase = true          -- Case insensitive search
vim.opt.smartcase = true           -- Case sensitive if uppercase in search
vim.opt.hlsearch = true            -- Highlight search results
vim.opt.incsearch = true           -- Incremental search
vim.opt.wrap = false               -- Don't wrap lines
vim.opt.tabstop = 4                -- Tab width
vim.opt.shiftwidth = 4             -- Indent width
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.smartindent = true         -- Smart indenting
vim.opt.autoindent = true          -- Auto indenting
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard
vim.opt.termguicolors = true       -- True color support
vim.opt.cursorline = true          -- Highlight current line
vim.opt.signcolumn = 'yes'         -- Always show sign column
vim.opt.updatetime = 250           -- Faster completion
vim.opt.timeoutlen = 300           -- Faster key sequence completion
vim.opt.backup = false             -- Don't create backup files
vim.opt.writebackup = false        -- Don't create backup before overwrite
vim.opt.swapfile = false           -- Don't use swapfile
vim.opt.undofile = true            -- Enable persistent undo
vim.opt.splitbelow = true          -- Horizontal splits below
vim.opt.splitright = true          -- Vertical splits to the right
vim.opt.scrolloff = 8              -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8          -- Keep 8 columns left/right of cursor
vim.opt.showmode = false           -- Don't show mode in command line
vim.opt.completeopt = 'menuone,noselect' -- Better completion

-- Key mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize windows with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Move text up and down
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Better indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Clear search highlights
keymap('n', '<leader>h', ':nohlsearch<CR>', opts)

-- Save file
keymap('n', '<leader>w', ':w<CR>', opts)

-- Quit
keymap('n', '<leader>q', ':q<CR>', opts)

-- Save and quit
keymap('n', '<leader>wq', ':wq<CR>', opts)

-- Force quit
keymap('n', '<leader>Q', ':q!<CR>', opts)

-- Split windows
keymap('n', '<leader>sv', ':vsplit<CR>', opts)
keymap('n', '<leader>sh', ':split<CR>', opts)

-- Close window
keymap('n', '<leader>c', '<C-w>c', opts)

-- File explorer
keymap('n', '<leader>e', ':Explore<CR>', opts)

-- Better paste
keymap('v', 'p', '"_dP', opts)

-- Keep cursor centered when scrolling
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)

-- Keep search matches centered
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Quick exit insert mode
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

-- Tab management
keymap('n', '<leader>tn', ':tabnew<CR>', opts)
keymap('n', '<leader>tc', ':tabclose<CR>', opts)
keymap('n', '<leader>to', ':tabonly<CR>', opts)

-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 })
  end,
})

-- Remove trailing whitespace on save
augroup('TrimWhitespace', { clear = true })
autocmd('BufWritePre', {
  group = 'TrimWhitespace',
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- Return to last edit position when opening files
augroup('LastPosition', { clear = true })
autocmd('BufReadPost', {
  group = 'LastPosition',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- File type specific settings
augroup('FileTypeSettings', { clear = true })
autocmd('FileType', {
  group = 'FileTypeSettings',
  pattern = { 'html', 'css', 'javascript', 'typescript', 'json', 'yaml', 'lua' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Netrw settings (built-in file explorer)
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

-- Color scheme (using built-in schemes)
vim.cmd([[
  try
    colorscheme habamax
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
  endtry
]])

-- Status line
vim.opt.laststatus = 2
vim.opt.statusline = '%f %m %r%=%l:%c %p%%'

-- Command line
vim.opt.cmdheight = 1
vim.opt.showcmd = true

print("Neovim configuration loaded!")
