return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-CR>",
        accept_word = false,
        accept_line = false,
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<C-e>",
      },
    },
    panel = { enabled = true },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    require("copilot_cmp").setup()

    -- Add custom keymap for Control+Enter
    vim.api.nvim_set_keymap("i", "<C-CR>", 'copilot#Accept("<CR>")', {
      expr = true,
      silent = true,
      script = true,
      replace_keycodes = false,
    })

    -- Optional: Add blinking effect similar to cmp
    vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#555555", bg = "NONE" })
    vim.cmd([[
      augroup CopilotBlink
        autocmd!
        autocmd User CopilotSuggestionVisible hi CopilotSuggestion guifg=#ffffff guibg=#3d3d3d
        autocmd User CopilotSuggestionInvisible hi CopilotSuggestion guifg=#555555 guibg=NONE
      augroup END
    ]])
  end,
}
