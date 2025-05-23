return {
  { "mason-org/mason.nvim", version = "1.11.0" },
  { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "stylua",
      "selene",
      "luacheck",
      "shellcheck",
      "shfmt",
      "tailwindcss-language-server",
      "typescript-language-server",
      "css-lsp",
      "omnisharp",
      "eslint-lsp",
      "html-lsp",
      "svelte-language-server",
      "angular-language-server",
      "graphql-language-service-cli",
      "emmet-ls",
      "prisma-language-server",
      "pyright",
      "ruff",
      "json-lsp",
      "yaml-language-server",
    })
  end,
}
