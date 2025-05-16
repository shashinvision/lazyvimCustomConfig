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
      opts.servers.tsserver = {
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
          javascript = {
            target = "ESNext",
            module = "ESNext",
          },
          typescript = {
            target = "ESNext",
            module = "ESNext",
          },
        },
      }
      opts.servers.eslint = {
        settings = {
          packageManager = "npm", -- o "yarn", "pnpm"
          codeActionOnSave = {
            enable = true,
            mode = "all",
          },
        },
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      }
    end,
  },
}
