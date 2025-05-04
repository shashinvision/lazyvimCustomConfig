-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>[", "<S-$>%", { noremap = true, desc = "Move to end {([])}" }) -- Te lleva al final o el principio de llave relacionada {}[]()

-- Find with hidden files
vim.keymap.set("n", "<leader><leader>", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Buscar archivos (incluye ocultos)" })

-- select all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true }) --" Para seleccionar todo con Control + A

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

-- Markdown Preview
vim.keymap.set("n", "<leader>m", "MarkdownPreview", { noremap = true })
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<cr>", { noremap = true })
vim.keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<cr>", { noremap = true })

-- Git Messenger
vim.keymap.set("n", "<leader>gm", ":GitMessenger<cr>", { noremap = true })

-- Refactor
vim.keymap.set("x", "<leader>r", "Refactor")
vim.keymap.set("n", "<leader>r", "Refactor")
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- ToggleTerm
vim.keymap.set("n", "<leader>T", "ToggleTerm", { noremap = true, desc = "ToggleTerm" })
vim.keymap.set("n", "<leader>Tt", ":ToggleTerm<cr>", { noremap = true, desc = "Toggle Terminal (default)" })
vim.keymap.set("n", "<leader>Tr", ":ToggleTerm direction=tab<cr>", { noremap = true, desc = "Toggle Terminal (tab)" })
vim.keymap.set(
  "n",
  "<leader>Tf",
  ":ToggleTerm direction=float<cr>",
  { noremap = true, desc = "Toggle Terminal (float)" }
)
vim.keymap.set(
  "n",
  "<leader>Th",
  ":ToggleTerm direction=horizontal<cr>",
  { noremap = true, desc = "Toggle Terminal (horizontal)" }
)
vim.keymap.set(
  "n",
  "<leader>Tv",
  ":ToggleTerm direction=vertical<cr>",
  { noremap = true, desc = "Toggle Terminal (vertical)" }
)

-- Run Files
vim.keymap.set("n", "<leader>j", "Execute Files", { noremap = true })
-- Execute Python file
vim.keymap.set(
  "n",
  "<leader>jp",
  ":w | :TermExec cmd='python3 \"%\"' size=50 direction=tab go_back=0<CR>",
  { noremap = true, desc = "Run Python File" }
)
-- Execute Java file
vim.keymap.set(
  "n",
  "<leader>jj",
  ":w | :TermExec cmd='java \"%\"' size=50 direction=tab go_back=0<CR>",
  { noremap = true, desc = "Run Java File" }
)
-- Execute C++ Files
vim.keymap.set(
  "n",
  "<leader>jr",
  ":w | :TermExec cmd='cr \"%\"' size=50 direction=tab go_back=0<CR>",
  { noremap = true, desc = "Compile and Run C++ File" }
)
vim.keymap.set(
  "n",
  "<leader>jd",
  ":w | :TermExec cmd='cr \"%\" -d' size=50 direction=tab go_back=0<CR>",
  { noremap = true, desc = "Compile and Run C++ File with Debug" }
)

vim.keymap.set("n", "<leader>/", function()
  local input = vim.fn.input("¿Incluir todas las rutas y archivos ocultos? (s/N): ")
  local include = input:lower() == "s"

  -- Configuración base que respeta tu telescope.lua
  local opts = {
    prompt_title = include and "Búsqueda (INCLUYENDO TODO)" or "Búsqueda (excluyendo ocultos)",
    file_ignore_patterns = include and {} or { -- Anula los patrones de ignorar si include=true
      "^node_modules/",
      "^%.git/",
      "^%.github/",
      "^%.vscode/",
      "^%.angular/",
      "^%.sonarqube/",
      "^%.scannerwork/",
      "^dist/",
    },
  }

  -- Añadimos argumentos especiales para ripgrep cuando include=true
  if include then
    opts.vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--no-ignore",
      "--hidden",
      "--no-ignore-parent",
      "--no-ignore-vcs",
    }
  end

  require("telescope.builtin").live_grep(opts)
end, { desc = "🔍Buscar texto (s=incluye Todo y ocultos)", noremap = true, silent = true })

-- Gitsigns Keymaps
vim.keymap.set("n", "]h", "<cmd>lua require('gitsigns').next_hunk()<CR>", { noremap = true, desc = "Next Hunk" })
vim.keymap.set("n", "[h", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { noremap = true, desc = "Prev Hunk" })

vim.keymap.set(
  "n",
  "<leader>Hs",
  "<cmd>lua require('gitsigns').stage_hunk()<CR>",
  { noremap = true, desc = "Stage Hunk" }
)
vim.keymap.set(
  "n",
  "<leader>Hr",
  "<cmd>lua require('gitsigns').reset_hunk()<CR>",
  { noremap = true, desc = "Reset Hunk" }
)

vim.keymap.set(
  "v",
  "<leader>Hs",
  "<cmd>lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
  { noremap = true, desc = "Stage Hunk (visual)" }
)
vim.keymap.set(
  "v",
  "<leader>Hr",
  "<cmd>lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
  { noremap = true, desc = "Reset Hunk (visual)" }
)

vim.keymap.set(
  "n",
  "<leader>HS",
  "<cmd>lua require('gitsigns').stage_buffer()<CR>",
  { noremap = true, desc = "Stage Buffer" }
)
vim.keymap.set(
  "n",
  "<leader>HR",
  "<cmd>lua require('gitsigns').reset_buffer()<CR>",
  { noremap = true, desc = "Reset Buffer" }
)

vim.keymap.set(
  "n",
  "<leader>Hu",
  "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>",
  { noremap = true, desc = "Undo Stage Hunk" }
)
vim.keymap.set(
  "n",
  "<leader>Hp",
  "<cmd>lua require('gitsigns').preview_hunk()<CR>",
  { noremap = true, desc = "Preview Hunk" }
)

vim.keymap.set(
  "n",
  "<leader>Hb",
  "<cmd>lua require('gitsigns').blame_line({full = true})<CR>",
  { noremap = true, desc = "Blame Line" }
)
vim.keymap.set(
  "n",
  "<leader>HB",
  "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>",
  { noremap = true, desc = "Toggle Line Blame" }
)

vim.keymap.set("n", "<leader>Hd", "<cmd>lua require('gitsigns').diffthis()<CR>", { noremap = true, desc = "Diff This" })
vim.keymap.set(
  "n",
  "<leader>HD",
  "<cmd>lua require('gitsigns').diffthis('~')<CR>",
  { noremap = true, desc = "Diff This ~" }
)

vim.keymap.set("o", "ih", "<cmd>lua require('gitsigns').select_hunk()<CR>", { noremap = true, desc = "Select Hunk" })
vim.keymap.set("x", "ih", "<cmd>lua require('gitsigns').select_hunk()<CR>", { noremap = true, desc = "Select Hunk" })
