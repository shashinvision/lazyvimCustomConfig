return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      -- Mini.surround para trabajar con pares (paréntesis, comillas, etc)
      require("mini.surround").setup({
        mappings = {
          add = "<leader>cA", -- Add surrounding
          delete = "<leader>cD", -- Delete surrounding
          find = "gsf", -- Find right surrounding
          find_left = "gsF", -- Find left surrounding
          highlight = "gsh", -- Highlight surrounding
          replace = "gsr", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      })

      -- Otros módulos de mini que quieras:
      require("mini.pairs").setup()
      require("mini.comment").setup()
      -- require("mini.ai").setup()
    end,
  },
}
