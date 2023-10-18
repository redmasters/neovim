return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies =
    { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope.builtin')
    local keymap = vim.keymap
    keymap.set('n', '<leader>ff', telescope.find_files, {})
    keymap.set('n', '<leader>fb', telescope.buffers, {})
    keymap.set('n', '<leader>cs', telescope.colorscheme, {})

    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",
        }
      }
    }

  --require('telescope').load_extension('fzf')
  end,
}

