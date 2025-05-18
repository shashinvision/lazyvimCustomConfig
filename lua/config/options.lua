-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local set = vim.opt -- Generals options (Windows/Files)

set.colorcolumn = "80"
set.termguicolors = true

-- vim.g.snacks_animate = false

-- line numbers
set.relativenumber = true -- show relative line numbers
set.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
set.tabstop = 2 -- 2 spaces for tabs (prettier default)
set.shiftwidth = 2 -- 2 spaces for indent width
set.expandtab = true -- expand tab to spaces
set.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
set.wrap = true

-- search settings
set.ignorecase = true -- ignore case when searching
set.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
set.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
set.termguicolors = true
set.background = "dark" -- colorschemes that can be light or dark will be made dark
set.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
set.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
set.clipboard = "unnamedplus" -- use system clipboard as default register

-- split windows
set.splitright = true -- split vertical window to the right
set.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
set.swapfile = false

-- set.textwidth = 120

-- if type(vim.lsp.inlay_hint) ~= "table" then
--   vim.lsp.inlay_hint = {
--     enable = function(_, _) end,
--   }
-- end
