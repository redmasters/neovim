vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("<C-d>", "<C-d>zz")
-- vim.keymap.set("<C-u>", "C-u>zz")

-- vim.keymap.set("x", "<leader>p", "\"_dP")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- nnoremap("<leader>t", ":botright 20sp term://zsh<CR>i")
