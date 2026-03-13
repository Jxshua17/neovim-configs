return{
    {
	"folke/tokyonight.nvim",
	lazy = false,
	config = function()
	    vim.cmd([[colorscheme tokyonight]])
	end,
    },

    {
	"nvim-lualine/lualine.nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
	    theme = 'tokyonight',
	}
    }, 
}
