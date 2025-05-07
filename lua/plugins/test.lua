return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  keys = {
    { "<leader>ta", "<cmd>TestNearest<cr>", desc = "Test Nearest (Vim test)" },
    { "<leader>tf", "<cmd>TestFile<cr>", desc = "Test File (Vim test)" },
    { "<leader>tx", "<cmd>TestSuite<cr>", desc = "Test Suite (Vim test)" },
    { "<leader>tl", "<cmd>TestLast<cr>", desc = "Test Last (Vim test)" },
    { "<leader>tg", "<cmd>TestVisit<cr>", desc = "Test Visit (Vim test)(Vim test)" },
  },
  config = function()
    vim.g["test#strategy"] = "vimux"
  end,
}
