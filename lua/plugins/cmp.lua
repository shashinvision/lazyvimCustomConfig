return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Fuentes de completado
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "petertriho/cmp-git",

      -- IA
      "zbirenbaum/copilot-cmp",
      "Exafunction/codeium.nvim",

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      -- Mejoras visuales
      "onsails/lspkind.nvim",
    },
    config = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Configuración base
      opts = vim.tbl_deep_extend("force", {
        sources = {
          { name = "nvim_lsp", group_index = 1 }, -- Máxima prioridad (LSP)
          { name = "luasnip", group_index = 1 }, -- Máxima prioridad (snippets)
          { name = "copilot", group_index = 2 }, -- Prioridad media (IA)
          { name = "codeium", group_index = 2 }, -- Prioridad media (IA)
          { name = "buffer", keyword_length = 1 }, -- Bajo prioridad pero rápido
          { name = "path", keyword_length = 1 }, -- Bajo prioridad pero rápido
          { name = "nvim_lua", keyword_length = 1 }, -- Bajo prioridad pero rápido
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   elseif luasnip.expand_or_jumpable() then
          --     luasnip.expand_or_jump()
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
          -- ["<S-Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   elseif luasnip.jumpable(-1) then
          --     luasnip.jump(-1)
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            show_labelDetails = true,
            symbol_map = {
              Copilot = "",
              Codeium = "",
            },
            menu = {
              copilot = "[Copilot]",
              codeium = "[Codeium]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              buffer = "[Buf]",
              path = "[Path]",
              nvim_lua = "[Lua]",
            },
          }),
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
          native_menu = false,
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
          keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
          keyword_length = 1, -- Valor consistente
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          }),
        },
      }, opts or {})

      -- Configuración de cmp-git con manejo de errores
      local ok, _ = pcall(require, "cmp_git")
      if ok then
        require("cmp_git").setup()
      end

      -- Aplicar configuración principal
      cmp.setup(opts)

      -- Configuración para cmdline (organizada en una función)
      local function setup_cmdline()
        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
        })
        cmp.setup.cmdline("?", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
        })
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
        })
      end
      setup_cmdline()

      -- Configuración específica para gitcommit
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({ { name = "git" } }, { { name = "buffer" } }),
      })
    end,
  },
}
