-- ~/.config/nvim/lua/plugins/codeium.lua
return {
  "Exafunction/codeium.nvim",
  -- "Exafunction/windsurf.vim", -- Replace with the actual plugin name

  event = "VeryLazy",

  keys = {
    { "<leader>ac", "<cmd>Codeium Chat<CR>", desc = "Codeium Chat" },
    { "<leader>aA", "<cmd>Codeium Auth<CR>", desc = "Codeium Auth" },
    {
      "<C-g>",
      mode = "i",
      function()
        return vim.fn["codeium#Accept"]()
      end,
      expr = true,
      desc = "Codeium Accept",
    },
    {
      "<C-x>",
      mode = "i",
      function()
        return vim.fn["codeium#Clear"]()
      end,
      expr = true,
      desc = "Codeium Clear",
    },
    -- { "<C-]>", mode = "i", function() return vim.fn['codeium#CycleCompletions'](1) end, expr = true, desc = "Codeium Next" },
    -- { "<C-[>", mode = "i", function() return vim.fn['codeium#CycleCompletions'](-1) end, expr = true, desc = "Codeium Prev" },
  },
  config = function()
    require("codeium").setup({
      enable_chat = true, -- enable chat commands
    })
  end,
}
