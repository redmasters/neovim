local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'wojciechkepka/vim-github-dark',
		as = 'vim-github-dark',
		config = function()
			vim.cmd('colorscheme ghdark')
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		'theprimeagen/harpoon'
	},
	{
		'github/copilot.vim'
	},
	{
		'tpope/vim-fugitive'
	},
	--- Uncomment these if you want to manage LSP servers from neovim
	-- {'williamboman/mason.nvim'},
	-- {'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{
		"NvChad/nvterm",
		config = function ()
			require("nvterm").setup({
				horizontal = {
					location = "rightbelow",
					split_ratio = .3,}
			})
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	}



}
)
