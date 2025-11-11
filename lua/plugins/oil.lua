return {
  "stevearc/oil.nvim",
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      "-",
      function()
        require("oil").toggle_float()
      end,
      desc = "Open parent directory (Oil)",
    },
    {
      "-q",
      function()
        vim.cmd("close")
      end,
      desc = "Close Oil or current window",
    },
  },
  config = function()
    require("oil").setup()
  end,
}
