return {
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.cmp",
    },
    keys = {
      -- Atajos en modo inserción (estilo Copilot)
      {
        "<C-CR>",
        function()
          return vim.fn["codeium#Accept"]()
        end,
        mode = "i",
        expr = true,
        desc = "Codeium: Accept",
      },
      {
        "<C-p>",
        function()
          return vim.fn["codeium#CycleCompletions"](1)
        end,
        mode = "i",
        expr = true,
        desc = "Codeium: Next",
      },
      {
        "<C-n>",
        function()
          return vim.fn["codeium#CycleCompletions"](-1)
        end,
        mode = "i",
        expr = true,
        desc = "Codeium: Prev",
      },
      {
        "<C-e>",
        function()
          return vim.fn["codeium#Clear"]()
        end,
        mode = "i",
        expr = true,
        desc = "Codeium: Clear",
      },

      -- Comandos en modo normal
      { "<leader>aA", "<cmd>Codeium Auth<cr>", mode = "n", desc = "Codeium: Auth" },
      { "<leader>aC", "<cmd>Codeium Chat<cr>", mode = "n", desc = "Codeium Chat" },
    },
    config = function()
      require("codeium").setup({
        enable_chat = true, -- Habilita el chat si lo usas
      })
    end,
  },
}
