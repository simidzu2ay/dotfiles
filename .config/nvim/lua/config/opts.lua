local opt = vim.opt

vim.g.mapleader = " "

vim.cmd [[set termguicolors]]
opt.termguicolors = true

opt.relativenumber = true
opt.nu = true

opt.backup = false
opt.swapfile = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir/'
opt.undofile = true

opt.incsearch = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.wrap = false
opt.scrolloff = 8

opt.updatetime = 50

opt.colorcolumn = '80'

opt.smartindent = true
