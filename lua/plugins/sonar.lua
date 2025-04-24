return {
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        },
        init_options = {
          omnisharpDirectory = vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/omnisharp"),
          csharpOssPath = vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcsharp.jar"),
          csharpEnterprisePath = vim.fn.expand("$MASON/share/sonarlint-analyzers/csharpenterprise.jar"),
        },
        settings = {
          sonarlint = {
            rules = {
              ["typescript:S101"] = { level = "on", parameters = { format = "^[A-Z][a-zA-Z0-9]*$" } },
              ["typescript:S103"] = { level = "on", parameters = { maximumLineLength = 180 } },
              ["typescript:S106"] = { level = "on" },
              ["typescript:S107"] = { level = "on", parameters = { maximumFunctionParameters = 7 } },
            },
          },
        },
      },
      filetypes = {
        "cs",
        "dockerfile",
        "python",
        "cpp",
        "java",
        "javascript",
        "typescript",
        "typescriptreact",
        "yaml",
        "html",
        "css",
        "json",
      },
    })
  end,
}
