return {
  {
    "neovim/nvim-lspconfig",
    {
      "Hoffs/omnisharp-extended-lsp.nvim",
      lazy = true,
    },
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      local util = require("lspconfig.util")

      -- Angular LS config
      opts.servers.angularls = {
        root_dir = require("lspconfig").util.root_pattern("angular.json", "project.json"),
        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
      }

      -- React
      opts.servers.ts_ls = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
            },
          },
        },
      }

      -- Remember omnisharp always took the last SDK installed on your PC
      opts.servers.omnisharp = {
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        root_dir = function(fname)
          return util.root_pattern("*.sln", "*.csproj", ".git")(fname) or vim.fn.getcwd()
        end,
        handlers = {
          ["textDocument/definition"] = require("omnisharp_extended").handler,
        },
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
        "ts_ls",
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
