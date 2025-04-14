-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>[", "<S-$>%", { noremap = true }) -- Te lleva al final o el principio de llave relacionada {}[]()

-- select all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true }) --" Para seleccionar todo con Control + A

-- UndoTree sirve para ver un listado en forma de arbol de los cambios en un archivo, es como un versionamiento a tiempo real
vim.keymap.set("n", "<leader>U", "Undotree", { noremap = true })
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

-- Molten like Jupyter Notebook experience
vim.keymap.set("n", "<leader>j", "Molten", { silent = true, desc = "Jupyter Notebook experience" })
vim.keymap.set("n", "<leader>Ji", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<leader>je", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<leader>jl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<leader>jr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
vim.keymap.set(
  "v",
  "<leader>ju",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "evaluate visual selection" }
)
