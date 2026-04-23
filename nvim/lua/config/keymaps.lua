local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "

-- General
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- Better navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")