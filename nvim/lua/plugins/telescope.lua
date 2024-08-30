return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults.file_ignore_patterns = {
        "node_modules",
        "build",
        "dist",
      }
    end,
  },
}
