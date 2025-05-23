return {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
    },
    opts = function(_, opts)
      opts = opts or {}
      opts.inlay_hints = { enabled = true }
      opts.servers = opts.servers or {}

      opts.servers.omnisharp = {
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
      }

      opts.servers.tailwindcss = {
        root_dir = function(...)
          return require("lspconfig.util").root_pattern(".git")(...)
        end,
      }

      opts.servers.tsserver = {
        root_dir = function(...)
          return require("lspconfig.util").root_pattern(".git")(...)
        end,
        single_file_support = false,
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "literal",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            target = "ESNext",
            module = "ESNext",
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            target = "ESNext",
            module = "ESNext",
          },
        },
      }

      opts.servers.eslint = {
        settings = {
          packageManager = "npm",
          codeActionOnSave = {
            enable = true,
            mode = "all",
          },
        },
        on_attach = function(client, bufnr)
          if client.name == "eslint" then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.cmd("EslintFixAll")
              end,
            })
          end
        end,
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
              ["bem.enabled"] = true,
            },
          },
        },
      }

      opts.servers.yamlls = {
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      }

      opts.servers.lua_ls = {
        single_file_support = true,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            completion = {
              workspaceWord = true,
              callSnippet = "Both",
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
            doc = { privateName = { "^_" } },
            type = { castNumberToInteger = true },
            diagnostics = {
              disable = { "incomplete-signature-doc", "trailing-space" },
              groupSeverity = {
                strong = "Warning",
                strict = "Warning",
              },
              groupFileStatus = {
                ["ambiguity"] = "Opened",
                ["await"] = "Opened",
                ["codestyle"] = "None",
                ["duplicate"] = "Opened",
                ["global"] = "Opened",
                ["luadoc"] = "Opened",
                ["redefined"] = "Opened",
                ["strict"] = "Opened",
                ["strong"] = "Opened",
                ["type-check"] = "Opened",
                ["unbalanced"] = "Opened",
                ["unused"] = "Opened",
              },
              unusedLocalExclude = { "_*" },
            },
            format = {
              enable = false,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
                continuation_indent_size = "2",
              },
            },
          },
        },
      }

      opts.servers.cssls = {}
      opts.servers.html = {}

      return opts
    end,

    config = function(_, opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Viene en la configuracion por defecto y esta deprecado
      -- De esta manera lo desactivamos
      opts.servers.ruff_lsp = nil

      for server, server_opts in pairs(opts.servers or {}) do
        local config_module = lspconfig[server]
        if config_module and type(config_module.setup) == "function" then
          local final_opts = vim.tbl_deep_extend("force", {
            capabilities = capabilities,
          }, server_opts or {})

          config_module.setup(final_opts)
        else
          vim.notify("[LSP] El servidor '" .. server .. "' no está disponible en lspconfig.", vim.log.levels.WARN)
        end
      end
    end,
  },
}
