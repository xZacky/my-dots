-- using <Space> as leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- buffer control
keymap.set("n", "<A-h>", "<Cmd>bprevious<CR>")
keymap.set("n", "<A-l>", "<Cmd>bnext<CR>")
keymap.set("n", "<A-q>", "<Cmd>bdelete<CR>")

-- move cursor between windows
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- close current window
keymap.set("n", "<C-q>", "<C-w>q")

-- accelerated "j" and "k"
keymap.set("n", "J", "18j")
keymap.set("n", "K", "18k")
keymap.set("v", "J", "18j")
keymap.set("v", "K", "18k")

-- write (save)
keymap.set("n", "<C-s>", "<Cmd>:w!<CR>")

-- select all
keymap.set("n", "<C-a>", "ggVG")

-- undo
keymap.set("n", "<C-z>", "u")

-- disable "R" in normal mode
keymap.set("n", "R", "")
-- disable "R" in visual mode
keymap.set("v", "R", "")

-- disable "U" in visual mode
keymap.set("v", "U", "")

-- disable "gd" and "gD" in normal mode
keymap.set("n", "gd", "")
keymap.set("n", "gD", "")
-- disable "gd" and "gD" in visual mode
keymap.set("v", "gd", "")
keymap.set("v", "gD", "")

-- cancel search highlighing
keymap.set("n", "<Leader>x", "<Cmd>nohl<CR>")
keymap.set("v", "<Leader>x", "<Cmd>nohl<CR>")
