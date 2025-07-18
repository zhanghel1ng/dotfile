-- require("avante.providers").get_current_provider()
-- local function avante_provider()
--
-- end
local function avante_name()
  return 'Avante' 
end
local M = {}
M.sections = {
  lualine_a = {
    {
      avante_name,
      color = { fg = "None", bg = "None" },
    },
  },
  -- lualine_b = {
  --   {
  --     avante_provider,
  --     color = { fg = "None", bg = "None" },
  --   }
  -- }
}
M.filetypes = { "Avante","AvanteSelectedFiles","AvanteInput" }
return M
