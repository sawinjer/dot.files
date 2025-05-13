vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

-- split windows
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")
