return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git" },
      hidden = true, -- ← Esto muestra archivos ocultos
    },
    pickers = {
      find_files = {
        hidden = true, -- ← También aplica a esta picker
      },
    },
  },
}
