return {
  {
    "NeogitOrg/neogit",
    event = "LazyFile",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "ibhagwan/fzf-lua", -- optional
    },
    config = function()
      require("neogit").setup({

        signs = {
          -- { CLOSED, OPENED }
          hunk = { "", "" },
          -- item = { "", "" },
          -- section = { "", "" },
        },
        graph_style = "unicode",
        integrations = {
          fzf_lua = true
        }
      })
    end,
  },
}
