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
        enable_chat = true,
        -- Custom prompt configuration
        tools = {
          language_server = {
            -- Custom system prompt for completions
            completion = {
              model = "default",
              system_prompt = [[
              You are an expert programmer. Your task is to provide concise and efficient code
              completions. Follow these guidelines:
              1. Respect the existing coding style
              2. Prioritize modern patterns and best practices
              3. Focus on security and performance
              4. Include helpful comments for complex logic
              5. Complete any missing error handling when appropriate
            ]],
            },
          },
          -- Chat configuration with custom prompt
          chat = {
            model = "default",
            system_prompt = [[
            You are a helpful coding assistant. When answering questions:
            - Provide clear, well-structured explanations
            - Include code examples when appropriate
            - Focus on practical solutions
            - Consider edge cases and error handling
            - Explain your reasoning for complex decisions
            - When suggesting refactors, explain the benefits
          ]],
          },
        },
      })
    end,
  },
}
