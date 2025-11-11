return {
  "catppuccin/nvim",
  name = "catppuccin",
  optional = true,
  opts = function(_, opts)
    opts.integrations = vim.tbl_deep_extend("force", opts.integrations or {}, {
      bufferline = true,
      treesitter = true,
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      which_key = true,
    })
  end,
}
