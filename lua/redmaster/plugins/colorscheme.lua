local M = {
  {'wojciechkepka/vim-github-dark',
  as = 'vim-github-dark',
  config = function()
    vim.cmd('colorscheme ghdark')
  end},
  {
    "catppuccin/nvim",
    name = "catppuccin", priority = 1000 
  },
  {
    "rebelot/kanagawa.nvim"
  }

}


return M
