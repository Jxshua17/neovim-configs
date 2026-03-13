return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

  init = function()
    vim.env.CC = 'gcc'
end,

  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.config")
    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "markdown",
        "typst",
      },
    })
  end,
}

