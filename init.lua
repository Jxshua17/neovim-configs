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

