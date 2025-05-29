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
          -- Add these to handle ES modules
          parserOptions = {
            ecmaVersion = "latest",
            sourceType = "module",
          },
          env = {
            es2021 = true,
            node = true,
          },
        },
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              -- Use vim.lsp.buf.format() instead of direct command
              vim.lsp.buf.format({ async = false })
              -- Run ESLint fix
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
