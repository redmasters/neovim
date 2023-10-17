return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope.builtin')
    local keymap = vim.keymap
    keymap.set('n', '<leader>ff', telescope.find_files, {})
    keymap.set('n', '<leader>fb', telescope.buffers, {})
    keymap.set('n', '<leader>cs', telescope.colorscheme, {})
  end,


}

