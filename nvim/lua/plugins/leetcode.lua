local leet_arg = "leetcode.nvim"
return {
  {
    "kawre/leetcode.nvim",
    lazy = leet_arg ~= vim.fn.argv(0, -1),
    build = ":TSUpdate html",
    dependencies = {
      "nvim-lua/plenary.nvim", -- telescope 所需
      "ibhagwan/fzf-lua",
      "MunifTanjim/nui.nvim",

      -- 可选
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- 配置放在这里
      cn = {
        enabled = true,
      },
      lang = "java",
      arg = "leet",
    },
  },
}
