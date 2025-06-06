return {
  -- Copilot core plugin en Lua
  {
    "zbirenbaum/copilot.lua",
    dependencies = { "hrsh7th/nvim-cmp" },

    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
          auto_trigger = true,
          keymap = {
            accept = "<C-CR>", -- acepta la sugerencia con Tab
            next = "<C-n>", -- siguiente sugerencia
            prev = "<C-p>", -- anterior sugerencia
            dismiss = "<C-e>", -- descartar sugerencia
          },
        },
        panel = { enabled = false },
      })
    end,
  },
}
