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
keymap.set("n", "J", "jjjjjjjjj")
keymap.set("n", "K", "kkkkkkkkk")
keymap.set("v", "J", "jjjjjjjjj")
keymap.set("v", "K", "kkkkkkkkk")

-- write (save)
keymap.set("n", "<C-s>", "<Cmd>:w!<CR>")

-- select all
keymap.set("n", "<C-a>", "ggVG")

-- undo
keymap.set("n", "<C-z>", "u")

-- disable "R"
keymap.set("n", "R", "")
keymap.set("v", "R", "")

-- disable "U"
keymap.set("n", "U", "")
keymap.set("v", "U", "")

-- disable "gd" and "gD"
keymap.set("n", "gd", "")
keymap.set("n", "gD", "")
keymap.set("v", "gd", "")
keymap.set("v", "gD", "")

-- cancel search highlighing
keymap.set("n", "<Leader>x", "<Cmd>nohl<CR>")
keymap.set("v", "<Leader>x", "<Cmd>nohl<CR>")
