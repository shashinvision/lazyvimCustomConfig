return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  keys = {
    { "<leader>cC", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME") .. "/Pictures"),
    has_breadcrumbs = true,
    show_workspace = true,
    has_line_number = true,
    bg_theme = "bamboo",
    breadcrumbs_separator = ">",
    watermark = "github.com/shashinvision powered by CodeSnap.nvim",
    code_font_family = "FiraCode Nerd Font",
    watermark_font_family = "FiraCode Nerd Font",
  },
}
