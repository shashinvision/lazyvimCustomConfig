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

      opts.ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "angularls",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "ruff_lsp",
        "eslint",
        "tailwindcss",
        "jsonls",
        "omnisharp",
      }
      opts.servers.emmet_ls = {
        filetypes = {
          "html",
          "css",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "blade",
          "php",
          "xml",
          "htmldjango",
          "heex",
          "eruby",
        },
        init_options = {
          html = {
            options = {
              -- Para forzar atributos con comillas
              ["bem.enabled"] = true,
            },
          },
        },
      }
    end,
  },
}
