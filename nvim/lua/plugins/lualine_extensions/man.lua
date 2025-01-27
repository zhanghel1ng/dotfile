local M = {}

M.sections = {
  lualine_a = {
    {

      function()
        return "MAN"
      end,
      color = { fg = "None", bg = "None" },
    },
  },
  lualine_b = { { "filename", file_status = false, color = { fg = "None", bg = "None" } } },
  lualine_y = { { "progress", color = { fg = "None", bg = "None" } } },
  lualine_z = { { "location", color = { fg = "None", bg = "None" } } },
}

M.filetypes = { "man" }

return M
