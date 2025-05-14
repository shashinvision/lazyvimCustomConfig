return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Web formats
      html = { "prettier" },
      vue = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      -- Angular support
      ["*.component.html"] = { "prettier" },
      -- C#
      cs = { "csharpier" },
      -- Optional: CSS/SCSS if needed
      css = { "prettier" },
      scss = { "prettier" },
    },
    formatters = {
      prettier = {
        prepend_args = {
          "--parser",
          "html", -- For HTML/Angular
          "--parser",
          "vue", -- For Vue files
          "--parser",
          "typescript", -- For TS files
        },
      },
    },
  },
}
