-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>[", "<S-$>%", { noremap = true, desc = "Move to end {([])}" }) -- Te lleva al final o el principio de llave relacionada {}[]()

-- select all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true }) --" Para seleccionar todo con Control + A

-- UndoTree sirve para ver un listado en forma de arbol de los cambios en un archivo, es como un versionamiento a tiempo real
vim.keymap.set("n", "<leader>U", "Undotree", { noremap = true, desc = "Undotree" })
vim.keymap.set("n", "<leader>Ut", ":UndotreeToggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>Uf", ":UndotreeFocus<CR>", { noremap = true })
vim.keymap.set("n", "<leader>Uh", ":UndotreeHide<CR>", { noremap = true })
vim.keymap.set("n", "<leader>Up", ":UndotreePersistUndo<CR>", { noremap = true })
vim.keymap.set("n", "<leader>Us", ":UndotreeShow<CR>", { noremap = true })

-- for Vim-Bookmarks
vim.keymap.set("n", "<leader>B", "Vim-Bookmarks/Bracey", { noremap = true })
vim.keymap.set("n", "<leader>Bm", "<Plug>BookmarkToggle", { noremap = true })
vim.keymap.set("n", "<leader>Bi", "<Plug>BookmarkAnnotate", { noremap = true })
vim.keymap.set("n", "<leader>Ba", "<Plug>BookmarkShowAll", { noremap = true })
vim.keymap.set("n", "<leader>Bn", "<Plug>BookmarkNext", { noremap = true })
vim.keymap.set("n", "<leader>Bp", "<Plug>BookmarkPrev", { noremap = true })
vim.keymap.set("n", "<leader>Bc", "<Plug>BookmarkClear", { noremap = true })
vim.keymap.set("n", "<leader>Bx", "<Plug>BookmarkClearAll", { noremap = true })
vim.keymap.set("n", "<leader>Bk", "<Plug>BookmarkMoveUp", { noremap = true })
vim.keymap.set("n", "<leader>Bj", "<Plug>BookmarkMoveDown", { noremap = true })
vim.keymap.set("n", "<leader>Bg", "<Plug>BookmarkMoveToLine", { noremap = true })

-- Live Serve
vim.keymap.set("n", "<leader>Bs", ":Bracey<cr>", { noremap = true })
vim.keymap.set("n", "<leader>Bp", ":BraceyStop<cr>", { noremap = true })

-- Git Messenger
vim.keymap.set("n", "<leader>gm", ":GitMessenger<cr>", { noremap = true })

local quarto = require("quarto")
quarto.setup()
vim.keymap.set("n", "<leader>j", quarto.quartoPreview, { silent = true, noremap = true, desc = "Quarto(Jupyter)" })
vim.keymap.set("n", "<leader>jp", quarto.quartoPreview, { silent = true, noremap = true, desc = "Quarto Preview" })

local runner = require("quarto.runner")
vim.keymap.set("n", "<leader>jc", runner.run_cell, { desc = "run cell", silent = true })
vim.keymap.set("n", "<leader>ja", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<leader>jA", runner.run_all, { desc = "run all cells", silent = true })
vim.keymap.set("n", "<leader>jl", runner.run_line, { desc = "run line", silent = true })
vim.keymap.set("v", "<leader>j", runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<leader>jR", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })
