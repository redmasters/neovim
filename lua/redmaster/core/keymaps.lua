vim.g.mapleader = " "

local keymap = vim.keymap
--
-- Atalhos Gerais --
keymap.set("n", "<leader>ee", vim.cmd.Lex)
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--
-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", {desc = "Move o cursor para esquerda"})
keymap.set("n", "<C-l>", "<C-w>l", {desc = "Move o cursor para direita"})
keymap.set("n", "<C-k>", "<C-w>k", {desc = "Move o cursor para cima"})
keymap.set("n", "<C-j>", "<C-w>j", {desc = "Move o cursor para baixo"})

-- tabs
keymap.set("n", "<leader>bo", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>x", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current t"<cmd>ab
keymap.set("n", "<S-l>", "<cmd>tabnext<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-h>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>bf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--
-- keymap to open new terminal in small buffer bellow using :terminal
keymap.set("n", "<silent><leader>t", "<cmd>ToggleTerm<cr>", { desc = "Open terminal in new tab" })

-- vim htt client
keymap.set("n", "<leader>dr", "<cmd>HTTPClientDoRequest<cr>", { desc = "Open terminal in new tab" })
