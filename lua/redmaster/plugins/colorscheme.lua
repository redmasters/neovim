local tokyonight  = {
  'folke/tokyonight.nvim',
  as = 'tokyonight',
  config = function()
    vim.cmd('colorscheme tokyonight')
  end
}

local github_dark = {
  'wojciechkepka/vim-github-dark',
  as = 'vim-github-dark',
  config = function()
    vim.cmd('colorscheme ghdark')
  end
}


local nvimide = {
      'ldelossa/nvim-ide',
      config = function ()

        require('ide').setup({
          icon_set = "default",
        })

      end

    }


return github_dark
-- return tokyonight
-- return nvimide
