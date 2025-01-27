-- lualine extension for lazy.nvim

local ok, lazy = pcall(require, "lazy")
if not ok then
  return ""
end

local M = {}

M.sections = {
  lualine_a = {
    {
      function()
        return "lazy 💤"
      end,
      { color = { fg = "None", bg = "None" } },
    },
  },
  lualine_b = {
    {
      function()
        return "loaded: " .. lazy.stats().loaded .. "/" .. lazy.stats().count
      end,
      { color = { fg = "None", bg = "None" } },
    },
  },
  lualine_c = {
    {
      require("lazy.status").updates,
      cond = require("lazy.status").has_updates,
      { color = { fg = "None", bg = "None" } },
    },
  },
}

M.filetypes = { "lazy" }

return M
