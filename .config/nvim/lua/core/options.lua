local opt = vim.opt

opt.shell = "zsh"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tags

local tab_size = 2

opt.tabstop = tab_size
opt.shiftwidth = tab_size
opt.expandtab = true
opt.autoindent = true

-- line
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

-- apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

