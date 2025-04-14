return {
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy", -- Load the plugin lazily
    config = function()
      vim.g.VM_maps = { -- in visual mode
        ["Find Under"] = "<C-n>", -- Replace C-d for "Find Under"
      }
    end,
  },
}
