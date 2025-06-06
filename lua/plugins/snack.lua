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

     🛡️  𝕊𝕙𝕒𝕤𝕙𝕚𝕟𝕍 ⚔️  Code Warrior ⚔️  🛡️

💻✨ Happy Hacking! Keep slaying bugs and crushing code! 🐞💥
]],
      },
    },
  },
}
