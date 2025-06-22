return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    -- Snippets listos para muchos lenguajes
    "rafamadriz/friendly-snippets",
    -- Iconos para tailwindcss
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  lazy = false,
  config = function()
    local ls = require("luasnip")

    -- Extensión de tipos de archivo
    ls.filetype_extend("typescript", { "javascript" })
    ls.filetype_extend("typescriptreact", { "javascript", "html" })

    -- ⚡ Carga snippets estilo VSCode (friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = {
        vim.fn.stdpath("data") .. "/lazy/friendly-snippets",
      },
    })

    -- ✅ Si prefieres cargar todos sin condición (más inmediato):
    require("luasnip.loaders.from_vscode").load()

    -- 💡 Custom Snippets
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets",
    })
  end,
}
