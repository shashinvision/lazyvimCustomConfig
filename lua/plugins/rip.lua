return {
  "chrisgrieser/nvim-rip-substitute",

  cmd = "RipSubstitute", -- Command to trigger the plugin

  keys = {
    {
      "<leader>R",
      function()
        require("rip-substitute").sub() -- Call the substitution function from the plugin
      end,
      mode = { "n", "x" }, -- Enable the keybinding in normal and visual modes
      desc = " rip substitute", -- Description for the keybinding
    },
  },
}
