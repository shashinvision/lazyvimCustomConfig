return {
  "emmanueltouzery/apidocs.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "ApidocsSearch", "ApidocsInstall", "ApidocsOpen", "ApidocsSelect", "ApidocsUninstall" },
  config = function()
    require("apidocs").setup()
  end,
  keys = {
    { "<leader>A", "ApidocsOpen", desc = "ApiDocs" },
    { "<leader>Ap", "<cmd>ApidocsOpen<cr>", desc = "Search Api Doc" },
  },
}
