return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        typescript = { "prettier" },
        cs = { "csharpier" },
      },
      formatters = {
        prettier = {
          command = "prettier",
          args = { "--stdin-filepath", "$FILENAME" },
        },
      },
    },
  },
}
