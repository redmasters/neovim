local P = {}
keymap = P
-- leader 
vim.g.mapleader = " "

-- local keymap = vim.keymap
local key_map = function (mode, key, result)
  vim.api.nvim_set_keymap(
  mode,
  key,
  result,
  {noremap = true, silent = true}
  )
end

-- Atalhos Gerais --
-- key_map("n", "<leader>ex", vim.cmd.Ex)
key_map("v", "J", ":m '>+1<CR>gv=gv")
key_map("v", "K", ":m '<-2<CR>gv=gv")

--
-- window management
key_map("n", "<leader>sv", "<C-w>v") -- split window vertically
key_map("n", "<leader>sh", "<C-w>s") -- split window horizontally
key_map("n", "<leader>sx", "<cmd>close<CR>") -- close current split window



-- tabs
key_map("n", "<leader>bo", "<cmd>tabnew<CR>") -- open new tab
key_map("n", "<leader>x", "<cmd>tabclose<CR>") -- close current t"<cmd>ab
key_map("n", "<leader>bn", "<cmd>tabn<CR>") --  go to next tab
key_map("n", "<leader>bp", "<cmd>tabp<CR>") --  go to previous tab
key_map("n", "<leader>bf", "<cmd>tabnew %<CR>") --  move current buffer to new tab
-- keymap to open new terminal in small buffer bellow using :terminal
key_map("n", "<leader>t", "<cmd>!tmux split-window -v <CR><CR>")

-- java
function P.map_java_keys(bufnr)
  --map_lsp_keys()
  print("mapping java keys")

  local spring_boot_run = './gradlew bootRun -Dspring-boot.run.profiles=$PROFILE'
  local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
  key_map("n", "<S-F9>", command)
  key_map("n", "<leader>l", ":lua require('jdtls').organize_imports()<CR>")
  key_map("n", "<leader>jc", ':lua require("jdtls").compile("incremental")')

end

return P
