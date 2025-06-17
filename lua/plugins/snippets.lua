return {
  { "rafamadriz/friendly-snippets" },
  {
    "honza/vim-snippets",
    lazy = true,
  },
  {
    "L3MON4D3/LuaSnip",
    opts = {
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        require("luasnip.loaders.from_snipmate").lazy_load({
          paths = {
            vim.fn.stdpath("data") .. "/lazy/vim-snippets",
            vim.fn.stdpath("config") .. "/snippets",
          },
        })
      end,
    },
  },
}
