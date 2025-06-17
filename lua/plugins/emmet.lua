return {
  "mattn/emmet-vim",
  init = function()
    -- Set up Emmet only for HTML and CSS-like files
    vim.g.user_emmet_mode = "inv" -- enable all functions in all modes
    vim.g.user_emmet_leader_key = "<C-z>"
    vim.g.user_emmet_settings = {
      indent_blockelement = 1,
      languages = {
        html = {
          extends = "css",
        },
        javascriptreact = {
          extends = "jsx",
        },
        typescriptreact = {
          extends = "jsx",
        },
      },
    }
  end,
}
