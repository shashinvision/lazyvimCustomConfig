return {
  "Exafunction/windsurf.vim", -- Replace with the actual plugin name
  event = "VeryLazy",
  keys = {
    { "<leader>ac", "<cmd>Codeium Chat<CR>", desc = "Open Codeium Chat" },
    { "<leader>aA", "<cmd>Codeium Auth<CR>", desc = "Authenticate Codeium" },
  },
  config = function()
    -- Additional configuration for Codeium plugin (if needed)
  end,
}
