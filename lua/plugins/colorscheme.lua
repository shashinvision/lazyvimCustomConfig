return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- or latte, frappe, macchiato
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
        },
        highlight_overrides = {
          mocha = function(colors)
            return {
              ["@keyword"] = { bg = colors.pink, fg = colors.base, bold = true },
              ["@keyword.return"] = { bg = colors.pink, fg = colors.base, bold = true },
              ["@keyword.function"] = { bg = colors.pink, fg = colors.base, bold = true },
              Keyword = { bg = colors.pink, fg = colors.base, bold = true },
            }
          end,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
