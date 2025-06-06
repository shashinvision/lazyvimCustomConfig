return {

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
🚀🔥 Welcome to Coding Madness!!! 🔥🚀

 ███████╗██╗  ██╗ █████╗ ███████╗██╗  ██╗██╗███╗   ██╗██╗   ██╗
 ██╔════╝██║  ██║██╔══██╗██╔════╝██║  ██║██║████╗  ██║██║   ██║
 ███████╗███████║███████║███████╗███████║██║██╔██╗ ██║██║   ██║
 ╚════██║██╔══██║██╔══██║╚════██║██╔══██║██║██║╚██╗██║╚██╗ ██╔╝
 ███████║██║  ██║██║  ██║███████║██║  ██║██║██║ ╚████║ ╚████╔╝ 
 ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝  ╚═══╝  

💻✨ Happy Hacking, Code Warrior ShashinV! ⚔️👾
Keep slaying bugs and crushing code! 🐞💥
]],
      },
    },
  },
}
