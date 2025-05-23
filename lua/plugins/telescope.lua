return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      hidden = true,
      file_ignore_patterns = {
        "^node_modules",
        "^dist/",
        "^.sonarqube/",
        "^.scannerwork/",
        "^%.angular/",
        "^%.vscode/",
        "^%.git/", -- ignore .git folder
        "^%.github/",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },
}
