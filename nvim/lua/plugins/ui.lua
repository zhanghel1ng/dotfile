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
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode_modern").setup({
        cursorline = true,
        transparent_background = false,
        nvim_tree_darker = true,
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = false, -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus",
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      term_colors = true,
      transparent_background = false,
      no_italic = true,
      no_bold = true,
      no_underline = true,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          -- base = "#000000",
          -- mantle = "#000000",
          -- crust = "#000000",
        },
      },
      integrations = {
        telescope = {
          enabled = false,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
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
  {
    "sainnhe/sonokai",
    lazy = true,
    config = function()
      -- vim.g.sonokai_style = "Shusia"
    end,
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "jacoborus/tender.vim", lazy = true },
  { "tiagovla/tokyodark.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    config = function()
      require("onedark").setup({
        style = "darker",
        code_style = {
          comments = "none",
        },
      })
    end,
  },
  -- { 'sonph/onehalf', rtp = 'vim/' },
  { "ahmedabdulrahman/aylin.vim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "NLKNguyen/papercolor-theme", lazy = true },
  {
    "liuchengxu/space-vim-dark",
    -- lazy = true,
  },
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
      colorscheme = "vscode_modern",
      -- colorscheme = "gruvbox",
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
