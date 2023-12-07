return {
  {
    "folke/noice.nvim",
    enabled = function()
      if vim.g.neovide then
        return false
      else
        return true
      end
    end,
    opts = function(_, opts)
      -- table.insert(opts.routes, {
      --   filter = {
      --     event = "notify",
      --     find = "No imformation available"
      --   },
      --   opts = {skip = true}
      -- })
      require("notify").setup({
        background_colour = "Normal",
      })
      -- opts.presets.lsp_doc_border = true
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {},
    config = function()
      require("gruvbox").setup({
        bold = false,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          folds = false,
        },
      })
    end,
  },
  { "sainnhe/sonokai", lazy = true },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  { "jacoborus/tender.vim", lazy = true },
  { "tiagovla/tokyodark.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    config = function()
      require("onedark").setup({
        code_style = {
          comments = "none",
        },
      })
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  -- { 'sonph/onehalf', rtp = 'vim/' },
  { "ahmedabdulrahman/aylin.vim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "NLKNguyen/papercolor-theme", lazy = true },
  { "liuchengxu/space-vim-dark", lazy = true },
  { "sainnhe/edge", lazy = true },
  { "B4mbus/oxocarbon-lua.nvim", lazy = true },
  { "tomasr/molokai", lazy = true },
  { "rose-pine/neovim", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  {
    "tanvirtin/monokai.nvim",
    lazy = true,
    config = function()
      require("monokai").setup({
        italics = false,
        bold = false,
      })
    end,
  },
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    enabled = true,
    config = function()
      require("transparent").setup({
        extra_groups = { -- table/string: additional groups that should be cleared
          -- In particular, when you set it to 'all', that means all available groups

          -- example of akinsho/nvim-bufferline.lua
          -- "BufferLineTabClose",
          -- "BufferlineBufferSelected",
          -- "BufferLineFill",
          -- "BufferLineBackground",
          -- "BufferLineSeparator",
          -- "BufferLineIndicatorSelected",
          "FloatBorder",
          "NormalFloat",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreeEndOfBuffer",
          "NeoTreeWinSeparator",
          "WinSeparator",
          "NoiceCmdlinePopupBorder",
          "NoiceCmdlinePopupTitle",
          "NoiceCmdlineIcon",
          "DiagnosticSignError",
          "DiagnosticSignWarn",
          "DiagnosticSignInfo",
          "DiagnosticSignHint",
          "DiagnosticSignOk",
          -- "NoiceFormatProgressDone",
          -- "NotifyINFOTitle2",
          -- "NotifyINFOBorder2",
          -- "NotifyINFOBody2",

          -- "NotifyINFOIcon2",
        },
        exclude_groups = {
          "CursorLine",
        },
      })
    end,
  },
  { "dracula/vim", lazy = true },
  {
    "sainnhe/everforest",
    lazy = true,
    config = function()
      vim.g.everforest_sign_column_background = "none"
      vim.g.everforest_disable_italic_comment = 1
    end,
  },
  { "sainnhe/gruvbox-material", lazy = true },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "vimEnter",
    opts = function(_, opts)
      local logo = [[

██╗   ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗
██║   ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║   ██║███████╗██║     ██║   ██║██║  ██║█████╗  
╚██╗ ██╔╝╚════██║██║     ██║   ██║██║  ██║██╔══╝  
 ╚████╔╝ ███████║╚██████╗╚██████╔╝██████╔╝███████╗
  ╚═══╝  ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
                                                  
    ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "onsails/lspkind.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      icons = {
        diagnostics = {
          Hint = "󰌵 ",
        },
        dap = {
          Breakpoint = "",
        },
        -- kinds = {
        --   Text = "  ",
        --   Method = "  ",
        --   Function = "  ",
        --   Constructor = "  ",
        --   Field = "  ",
        --   Variable = "  ",
        --   Class = "  ",
        --   Interface = "  ",
        --   Module = "  ",
        --   Property = "  ",
        --   Unit = "  ",
        --   Value = "  ",
        --   Enum = "  ",
        --   Keyword = "  ",
        --   Snippet = "  ",
        --   Color = "  ",
        --   File = "  ",
        --   Reference = "  ",
        --   Folder = "  ",
        --   EnumMember = "  ",
        --   Constant = "  ",
        --   Struct = "  ",
        --   Event = "  ",
        --   Operator = "  ",
        --   TypeParameter = "  ",
        -- },
      },
    },
  },
}
