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
      -- CSS/SCSS
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    formatters = {
      prettier = {
        -- Skip formatting if Prettier fails
        condition = function(ctx)
          return vim.fs.find({ "prettier.config.js", ".prettierrc" }, { path = ctx.filename, upward = true })[1]
            or vim.fs.find({ "package.json" }, { path = ctx.filename, upward = true })[1]
        end,
        -- Run in "range" mode for partial formatting
        range_args = function(ctx)
          return { "--range-start=" .. ctx.range.start[1], "--range-end=" .. ctx.range["end"][1] }
        end,
      },
    },
  },
}
