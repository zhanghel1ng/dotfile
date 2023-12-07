-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.showmatch=true
opt.autoindent = true
opt.smartindent = true
opt.clipboard = ""

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.o.guifont = "JetBrainsMono Nerd Font:h11"
  vim.opt.linespace = -3
end
