return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

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

      -- CSharp and Dotnet with multiple versions

      -- local function get_dotnet_sdk_version()
      --   local handle = io.popen("dotnet --version 2>/dev/null")
      --   if not handle then
      --     return nil
      --   end
      --   local result = handle:read("*a")
      --   handle:close()
      --   return result and vim.trim(result)
      -- end
      --
      -- local sdk_version = get_dotnet_sdk_version() or "8.0.415"

      opts.servers.omnisharp = {
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        organize_imports_on_format = true,
        enable_roslyn_analyzers = true,
        analyze_open_documents_only = false,
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
          },
          RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
            LocationPaths = {},
          },
          -- Sdk = {
          --   IncludePrereleases = false,
          --   Version = sdk_version,
          -- },
          MsBuild = {
            LoadProjectsOnDemand = false,
          },
        },
        root_dir = function(fname)
          local util = require("lspconfig.util")
          -- busca el global.json más cercano o .sln/.csproj
          return util.root_pattern("global.json", "*.sln", "*.csproj")(fname)
        end,
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
          client.server_capabilities.diagnosticProvider = false
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
