-- return {
--   "Exafunction/windsurf.vim",
--   event = "BufEnter",
--   keys = {
--     { "<leader>ac", "<cmd>Codeium Chat<CR>", desc = "Codeium Chat" },
--     { "<leader>aA", "<cmd>Codeium Auth<CR>", desc = "Codeium Auth" },
--   },
-- }

return {
  "Exafunction/windsurf.vim", -- Corrected from "windsurf.vim" to "codeium.vim"
  event = "BufEnter",
  init = function()
    -- Set up Codeium keybindings to match your Copilot style
    vim.g.codeium_no_map_tab = 1 -- Disable default Tab mapping
    vim.g.codeium_enabled = true
  end,
  keys = {
    { "<leader>aC", "<cmd>Codeium Chat<CR>", desc = "Codeium Chat" },
    { "<leader>aA", "<cmd>Codeium Auth<CR>", desc = "Codeium Auth" },
    -- Add your Copilot-style navigation keymaps
    { "<C-n>", mode = "i", "<Cmd>call codeium#CycleCompletions(1)<CR>", desc = "Next suggestion" },
    { "<C-p>", mode = "i", "<Cmd>call codeium#CycleCompletions(-1)<CR>", desc = "Previous suggestion" },
    { "<CR>", mode = "i", "<Cmd>call codeium#Accept()<CR>", desc = "Accept suggestion" },
    { "<C-e>", mode = "i", "<Cmd>call codeium#Clear()<CR>", desc = "Dismiss suggestion" },
  },
  config = function()
    -- Optional: Add blinking effect similar to your Copilot setup
    vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = "#555555", bg = "NONE" })
    vim.cmd([[
      augroup CodeiumBlink
        autocmd!
        autocmd User CodeiumSuggestionVisible hi CodeiumSuggestion guifg=#ffffff guibg=#3d3d3d
        autocmd User CodeiumSuggestionInvisible hi CodeiumSuggestion guifg=#555555 guibg=NONE
      augroup END
    ]])
  end,
}
