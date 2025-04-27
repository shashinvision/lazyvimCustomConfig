-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         omnisharp = {}, -- OmniSharp activo
--         csharp_ls = { enabled = false }, -- <<-- Desactiva csharp_ls
--       },
--     },
--   },
-- }
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.omnisharp = {
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
      }
      opts.servers.tsserver = opts.servers.tsserver or {}
      opts.servers.eslint = opts.servers.eslint or {}
    end,
  },
}
