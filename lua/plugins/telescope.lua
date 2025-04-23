return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      hidden = true,
      file_ignore_patterns = {
        "node_modules",
        "^%.git/", -- this Pattern is used to ignore the .git directory and not the .gitignore
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },
}
