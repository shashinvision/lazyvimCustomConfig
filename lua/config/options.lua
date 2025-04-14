-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local set = vim.opt -- Generals options (Windows/Files)
local cmd = vim.cmd -- for VimScript commands

set.colorcolumn = "80"
set.history = 1000 -- Sets how many lines of history VIM has to remember
set.undofile = true -- Save undos after file closes
set.undolevels = 1000 -- How many undos
set.undoreload = 10000 -- Number of lines to save for undo
cmd("set undodir=~/.config/nvim/undodir") -- where to save undo histories, lua have a trouble with path HOME path '~''
