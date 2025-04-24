return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {}, -- OmniSharp activo
        csharp_ls = { enabled = false }, -- <<-- Desactiva csharp_ls
      },
    },
  },
}
