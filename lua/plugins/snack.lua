return {
  "snacks.nvim",
  opts = {
    picker = {
      hidden = true, -- for hidden files
      ignored = false, -- for .gitignore files
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
