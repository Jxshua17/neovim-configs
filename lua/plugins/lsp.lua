return{
    'neovim/nvim-lspconfig',
    -- dependencies = {
--	'mason-org/mason.nvim',
--	'mason-org/mason-lspconfig.nvim',
--
--	'hrsh7th/cmp-nvim-lsp',
--	'hrsh7th/cmp-buffer',
--	'hrsh7th/cmp-path',
---	'hrsh7th/cmp-cmdline',
--	'hrsh7th/nvim-cmp',
  --  },

    dependencies = { 'saghen/blink.cmp' },

  -- example using `opts` for defining servers
    opts = {
	servers = {
	lua_ls = {}
	}
    },

    automatic_enable = {
        "typst_lsp",
    },

    config = function()

--	local cfg = vim.lsp.config.blink
	
	local capabilities = require('blink.cmp').get_lsp_capabilities()
	--local lspconfig = require('lspconfig')

	vim.lsp.config('lua_ls', capabilities)
	--lspconfig['lua_ls'].setup({ capabilities = capabilities })

   end
}
