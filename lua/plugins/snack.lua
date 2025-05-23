return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  "snacks.nvim",
  opts = {
    picker = {
      hidden = true, -- for hidden files
      ignored = true, -- for .gitignore files
    },
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
        Wellcome to coding!!!

        ███████╗██╗  ██╗ █████╗ ███████╗██╗  ██╗██╗███╗   ██╗██╗   ██╗
        ██╔════╝██║  ██║██╔══██╗██╔════╝██║  ██║██║████╗  ██║██║   ██║
        ███████╗███████║███████║███████╗███████║██║██╔██╗ ██║██║   ██║
        ╚════██║██╔══██║██╔══██║╚════██║██╔══██║██║██║╚██╗██║╚██╗ ██╔╝
        ███████║██║  ██║██║  ██║███████║██║  ██║██║██║ ╚████║ ╚████╔╝ 
        ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝  ╚═══╝  
        Happy Hacking!
 ]],
      },
    },
  },
}
