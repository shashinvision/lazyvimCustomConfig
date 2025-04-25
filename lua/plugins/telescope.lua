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
        "^%.git/", -- this Pattern is used to ignore the .git directory and not the .gitignore
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
