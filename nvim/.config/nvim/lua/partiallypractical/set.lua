vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.splitbelow = true
-- vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.cmdheight = 2

vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
