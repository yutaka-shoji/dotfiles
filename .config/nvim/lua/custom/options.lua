-- Line Numbers
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.termguicolors = true
-- Window Opacity
vim.opt.winblend = 10
-- Pop-Up Opacity
vim.opt.pumblend = 10
-- Enable mouse mode
vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- show brace paier
vim.opt.showmatch = true
-- command line completion
vim.opt.wildmenu = true
vim.opt.wildmode = { 'list:longest', 'full' }
-- onemore cursor
vim.opt.virtualedit = 'onemore'
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
-- incremental search
vim.opt.incsearch = true
-- back-to-top when searching end
vim.opt.wrapscan = true
-- Set highlight on search
vim.opt.hlsearch = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Preview substitutions live, as you type
vim.opt.inccommand = 'split'
-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Tab-Space
vim.opt.ambiwidth = 'single'
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
