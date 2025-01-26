-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local g = vim.g
opt.showmatch = true
opt.autoindent = true
opt.smartindent = true
opt.clipboard = ""
-- opt.signcolumn = "no"
opt.relativenumber = false
opt.jumpoptions = "stack"
-- opt.winblend = 0
opt.list = false
g.trouble_lualine = false
opt.showcmd = false -- 禁用按键显示
g.snacks_animate = false
if g.neovide then
  g.neovide_cursor_animation_length = 0
  vim.o.guifont = "JetBrainsMono Nerd Font:h11"
  vim.opt.linespace = -3
  g.neovide_theme = "dark"
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
  -- vim.g.neovide_transparency = 0.95
  -- vim.g.neovide_normal_opacity = 0.95
end
