-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.showmatch = true
opt.autoindent = true
opt.smartindent = true
opt.clipboard = ""
-- opt.signcolumn = "no"
opt.relativenumber = false
opt.jumpoptions = "stack"
-- opt.cursorline = false
-- vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_python_ruff = "ruff_lsp"
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.o.guifont = "JetBrainsMono Nerd Font:h11"
  vim.opt.linespace = -3
  vim.g.neovide_theme = "dark"
end
