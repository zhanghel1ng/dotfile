-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.

local function get_short_cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
end

local M = {}

M.sections = {
  lualine_a = {
    {
      get_short_cwd,
      color = { fg = "None", bg = "None" },
    },
  },
}

M.filetypes = { "neo-tree" }

return M
