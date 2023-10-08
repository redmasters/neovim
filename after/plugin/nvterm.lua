require("nvterm").setup()
local terminal = require("nvterm.terminal")

local toggle_modes = {'n', 't'}

local mappings = {
	{toggle_modes, '<leader>t', function() terminal.toggle('horizontal') end},
}

local opts = {silent = true, noremap = true}
for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
