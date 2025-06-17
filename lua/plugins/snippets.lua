return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    {
      "honza/vim-snippets",
      lazy = true,
    },
  },
  lazy = true,
  config = function()
    local ls = require("luasnip")

    -- Extensiones de filetype
    ls.filetype_extend("typescript", { "javascript" })
    ls.filetype_extend("typescriptreact", { "javascript", "html" })

    -- Carga de snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load({
      paths = {
        vim.fn.stdpath("data") .. "/lazy/vim-snippets",
        vim.fn.stdpath("config") .. "/snippets",
      },
    })
  end,
}
