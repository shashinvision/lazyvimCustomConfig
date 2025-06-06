return {
  -- Copilot core plugin en Lua
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>", -- acepta la sugerencia con Tab
            next = "<C-]>", -- siguiente sugerencia
            prev = "<C-[>", -- anterior sugerencia
            dismiss = "<C-c>", -- descartar sugerencia
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  -- Copilot para integrar con blink-cmp
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        -- Opciones extra para blink-cmp si necesitas
        method = "getCompletionsCycling", -- método para obtener sugerencias
      })
    end,
  },
}
