-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Clean :%s/^M//g
keymap.set("n", "<leader>cM", ":s/^M//g<CR>", { noremap = true, silent = true, desc = "Delete blank spaces(^M)" })

keymap.set("n", "<leader>[", "<S-$>%", { noremap = true, desc = "Move to end {([])}" }) -- Te lleva al final o el principio de llave relacionada {}[]()

-- Find with hidden files
keymap.set("n", "<leader><leader>", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Buscar archivos (incluye ocultos)" })

-- select all
keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true }) --" Para seleccionar todo con Control + A
keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })
keymap.set("v", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- LSP
keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })

-- for Vim-Bookmarks
keymap.set("n", "<leader>B", "Vim-Bookmarks/Bracey", { noremap = true })
keymap.set("n", "<leader>Bm", "<Plug>BookmarkToggle", { noremap = true })
keymap.set("n", "<leader>Bi", "<Plug>BookmarkAnnotate", { noremap = true })
keymap.set("n", "<leader>Ba", "<Plug>BookmarkShowAll", { noremap = true })
keymap.set("n", "<leader>Bn", "<Plug>BookmarkNext", { noremap = true })
keymap.set("n", "<leader>Bp", "<Plug>BookmarkPrev", { noremap = true })
keymap.set("n", "<leader>Bc", "<Plug>BookmarkClear", { noremap = true })
keymap.set("n", "<leader>Bx", "<Plug>BookmarkClearAll", { noremap = true })
keymap.set("n", "<leader>Bk", "<Plug>BookmarkMoveUp", { noremap = true })
keymap.set("n", "<leader>Bj", "<Plug>BookmarkMoveDown", { noremap = true })
keymap.set("n", "<leader>Bg", "<Plug>BookmarkMoveToLine", { noremap = true })

-- Live Serve
keymap.set("n", "<leader>Bs", ":Bracey<cr>", { noremap = true })
keymap.set("n", "<leader>Bp", ":BraceyStop<cr>", { noremap = true })

-- Markdown Preview
keymap.set("n", "<leader>m", "MarkdownPreview", { noremap = true })
keymap.set("n", "<leader>mp", ":MarkdownPreview<cr>", { noremap = true })
keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<cr>", { noremap = true })
keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<cr>", { noremap = true })

-- Git Messenger
keymap.set("n", "<leader>gm", ":GitMessenger<cr>", { noremap = true })

-- Refactor
keymap.set("x", "<leader>r", "Refactor")
keymap.set("n", "<leader>r", "Refactor")
keymap.set("x", "<leader>re", ":Refactor extract ")
keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
keymap.set("x", "<leader>rv", ":Refactor extract_var ")
keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
keymap.set("n", "<leader>rI", ":Refactor inline_func")
keymap.set("n", "<leader>rb", ":Refactor extract_block")
keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- ToggleTerm
keymap.set("n", "<leader>T", "ToggleTerm", { noremap = true, desc = "ToggleTerm" })
keymap.set("n", "<leader>Tt", ":ToggleTerm<cr>", { noremap = true, desc = "Toggle Terminal (default)" })
keymap.set("n", "<leader>Tr", ":ToggleTerm direction=tab<cr>", { noremap = true, desc = "Toggle Terminal (tab)" })
keymap.set("n", "<leader>Tf", ":ToggleTerm direction=float<cr>", { noremap = true, desc = "Toggle Terminal (float)" })
keymap.set(
  "n",
  "<leader>Th",
  ":ToggleTerm direction=horizontal<cr>",
  { noremap = true, desc = "Toggle Terminal (horizontal)" }
)
keymap.set(
  "n",
  "<leader>Tv",
  ":ToggleTerm direction=vertical<cr>",
  { noremap = true, desc = "Toggle Terminal (vertical)" }
)

-- Run Files
keymap.set("n", "<leader>j", "Execute Files", { noremap = true })
-- Execute Python file
keymap.set(
  "n",
  "<leader>jp",
  ":w | :TermExec cmd='python3 \"%\"' size=50 direction=tab go_back=0<CR>",
  { noremap = true, desc = "Run Python File" }
)
-- Execute Java file
keymap.set(
  "n",
  "<leader>jj",
  ":w | :TermExec cmd='java \"%\"' size=50 direction=tab go_back=0<CR>",
  { noremap = true, desc = "Run Java File" }
)
-- Execute C++ Files
keymap.set(
  "n",
  "<leader>jr",
  ":w | :TermExec cmd='cr \"%\"' size=50 direction=tab go_back=0<CR>",
  { noremap = true, desc = "Compile and Run C++ File" }
)
keymap.set(
  "n",
  "<leader>jd",
  ":w | :TermExec cmd='cr \"%\" -d' size=50 direction=tab go_back=0<CR>",
  { noremap = true, desc = "Compile and Run C++ File with Debug" }
)
