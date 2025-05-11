return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  -- dependencies = {
  --   "zbirenbaum/copilot-cmp",
  -- },
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    -- require("copilot_cmp").setup()
  end,
}
