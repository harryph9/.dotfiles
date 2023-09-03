local opt = vim.opt

--vim.cmd("syntax off")

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
vim.opt.hlsearch = true

vim.opt.laststatus = 2
vim.opt.cmdheight = 1

opt.termguicolors = true
opt.background = "dark"

opt.backspace = "indent,eol,start"

opt.clipboard = "unnamedplus"
opt.backup = false
