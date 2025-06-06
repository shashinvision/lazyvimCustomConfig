return {
  -- Copilot core plugin en Lua
  {
    "zbirenbaum/copilot.lua",
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
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        method = "getCompletionsCycling",
      })
    end,
  },
}
