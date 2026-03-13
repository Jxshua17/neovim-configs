require('configs.options')
require('configs.keybindings')
require('configs.lazy')

require("nvim-treesitter.install").compilers = { "gcc" }
-- vim.env.CC = "zig"

require'nvim-treesitter'.install { 'typst' }

-- require('lsp.typst')\
--
-- vim.lsp.config('typst-lsp',{
    -- cmd = {
    --'typst-lsp',
  --},
  --root_markers = { '.git', },
  --filetypes = { 'typst', },
--})

--vim.lsp.config['typst_lsp'] = {
  --  cmd = {'typst-lsp'},
    -- root_markers = { '.git', },
     -- filetypes = { 'typst', },
-- }

vim.lsp.config["tinymist"] = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
        -- ...
    }
}


-- vim.lsp.enable('typst_lsp')
vim.lsp.enable('tinymist')

-- adding and enabling the lsp for markdown.

vim.lsp.config["marksman"] = {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx" },
    root_markers = { ".marksman.toml", ".git" },
}

vim.lsp.enable('marksman')

-- adding  and enabling the lsp for lua_ls
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library',
          -- '${3rd}/busted/library',
        },
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = vim.api.nvim_get_runtime_file('', true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
}) 

vim.lsp.enable('lua_ls')

vim.cmd([[

set noshelltemp
let &shell = 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
let &shellcmdflag .= '[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();'
let &shellcmdflag .= '$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
let &shellpipe  = '> %s 2>&1'
set shellquote= shellxquote=

let &shellcmdflag .= '$PSStyle.OutputRendering = ''PlainText'';'
" Workaround (may not be needed in future version of pwsh):
let $__SuppressAnsiEscapeSequences = 1



]])

