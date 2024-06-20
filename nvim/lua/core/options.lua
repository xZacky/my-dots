local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- disable the mouse while in nvim
opt.mouse:append("a")

-- completation options for insert mode
opt.completeopt = "menu,menuone"

-- auto read for changed file
opt.autoread = true

-- do not use swap file
opt.swapfile = false

-- do not use backup
opt.backup = false

-- automatically execute .nvim.lua
opt.exrc = true

-- triggers event faster
opt.updatetime = 200
