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

      opts.servers.eslint = {
        settings = {
          packageManager = "npm",
          codeActionOnSave = {
            enable = true,
            mode = "all",
          },
          parserOptions = {
            ecmaVersion = "latest",
            sourceType = "module",
          },
          env = {
            es2021 = true,
            node = true,
          },
        },
        on_attach = function(client, bufnr)
          -- Disable ESLint diagnostics (stops the "Unexpected token 'export'" error)
          client.server_capabilities.diagnosticProvider = false

          -- Keep ESLint fixes on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
              vim.cmd([[EslintFixAll]])
            end,
          })
        end,
      }

      opts.servers.tsserver = opts.servers.tsserver or {}
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
              ["bem.enabled"] = true,
            },
          },
        },
      }

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
        "jsonls",
        "omnisharp",
      }
    end,
  },
}
