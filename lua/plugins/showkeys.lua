return {
  "nvzone/showkeys",
  event = "VeryLazy", -- Espera a que Neovim haya terminado de cargar
  opts = {
    maxkeys = 5,
  },
  config = function(_, opts)
    require("showkeys").setup(opts)
    vim.schedule(function()
      vim.cmd("ShowkeysToggle")
    end)
  end,
}
