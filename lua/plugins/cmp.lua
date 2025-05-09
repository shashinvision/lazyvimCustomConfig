return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "zbirenbaum/copilot-cmp",
    "saghen/blink.cmp",
    "Exafunction/codeium.nvim",
    "petertriho/cmp-git",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local opts = {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-g>"] = cmp.mapping(function()
          return vim.fn["codeium#Accept"]()
        end, { "i" }),
        ["<C-x>"] = cmp.mapping(function()
          return vim.fn["codeium#Clear"]()
        end, { "i" }),
      }),
      sources = cmp.config.sources({
        { name = "codeium" },
        { name = "copilot" },
        { name = "blink" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lua" },
      }),
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            codeium = "[AI]",
            copilot = "[Copilot]",
            blink = "[Blink]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
            nvim_lua = "[Lua]",
            git = "[Git]",
          })[entry.source.name]
          return vim_item
        end,
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
        keyword_length = 1,
      },
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }),
      },
    }

    -- Setup git source if available
    pcall(require, "cmp_git")
    if package.loaded["cmp_git"] then
      require("cmp_git").setup()
      table.insert(opts.sources, { name = "git" })
    end

    cmp.setup(opts)

    -- Cmdline configuration
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

    -- Git commit specific configuration
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({ { name = "git" } }, { { name = "buffer" } }),
    })
  end,
}
