-- ~/.config/nvim/lua/plugins/codeium.lua
return {
  "Exafunction/codeium.nvim",
  -- "Exafunction/windsurf.vim", -- Replace with the actual plugin name

  event = "VeryLazy",
  keys = {
    { "<leader>ac", "<cmd>Codeium Chat<CR>", desc = "Open Codeium Chat" },
    { "<leader>aA", "<cmd>Codeium Auth<CR>", desc = "Authenticate Codeium" },
  },
  config = function()
    require("codeium").setup({
      enable_chat = true, -- enable chat commands
    })
  end,
}
