return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
    -- enabled = function()
    --   if vim.g.neovide then
    --     return false
    --   else
    --     return true
    --   end
    -- end,
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
      opts.presets.lsp_doc_border = false
    end,
  },
  {
    "gmr458/vscode_modern_theme.nvim",
    lazy = true,
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
    "Mofiqul/vscode.nvim",
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
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
    lazy = true,
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
        toggle_style_key = "<leader>uo", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- L
      })
    end,
  },
  -- { 'sonph/onehalf', rtp = 'vim/' },
  { "ahmedabdulrahman/aylin.vim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "NLKNguyen/papercolor-theme", lazy = true },
  {
    "liuchengxu/space-vim-dark",
    lazy = true,
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
          -- "FloatBorder",
          -- "NormalFloat",
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
      vim.g.everforest_disable_italic_comment = 1
      vim.g.everforest_cursor = "red"
      -- vim.g.everforest_transparent_background = 1
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      -- vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_disable_italic_comment = true
      -- vim.g.gruvbox_material_foreground = "origin"
      -- vim.g.gruvbox_material_enable_bold = true
      -- require("lualine").setup({
      --   options = {
      --     theme = "gruvbox-material",
      --   },
      -- })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    -- ft = { "vue", "css", "html", "js", "ts", "lua" },
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
      -- colorscheme = "vscode",
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
  {
    "folke/snacks.nvim",
    opts = {
      -- scroll = { enabled = false },
      indent = { enabled = false },
    },
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   enabled = true,
  -- },
  -- {
  --   "akinsho/toggleterm.nvim",
  --   version = "*",
  --   config = function()
  --     require("toggleterm").setup({
  --       direction = "tab",
  --       open_mapping = [[<c-\]],
  --       close_on_exit = true,
  --       float_opts = {
  --         border = "curved",
  --         winblend = 0,
  --         highlights = {
  --           border = "Normal",
  --           background = "Normal",
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "shaunsingh/nord.nvim",
    config = function() end,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    opts = {
      options = {
        theme = "none", -- 使用主题颜色，但覆盖背景色
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- 全局禁用背景色
        disabled_filetypes = {},
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            color = { fg = "NONE", bg = "None" }, -- bg 设为 None
          },
        },
        lualine_b = {
          { "branch", color = { fg = "None", bg = "None" } },
          { "diff", color = { bg = "None" } },
          {
            "diagnostics",
            color = { bg = "None" },
            symbols = {
              error = LazyVim.config.icons.diagnostics.Error,
              warn = LazyVim.config.icons.diagnostics.Warn,
              info = LazyVim.config.icons.diagnostics.Info,
              hint = LazyVim.config.icons.diagnostics.Hint,
            },
          },
          -- color = { bg = "None" }, -- 组件背景透明
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- 显示完整路径
            color = { bg = "None" }, -- 文件名背景透明
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { { "progress", color = { fg = "None", bg = "None" } } },
        lualine_z = { { "location", color = { fg = "None", bg = "None" } } },
      },
      -- 对 inactive 部分同样处理
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {
        require("plugins.lualine_extensions.fzf"),
        require("plugins.lualine_extensions.lazy"),
        require("plugins.lualine_extensions.toggleterm"),
        require("plugins.lualine_extensions.man"),
        require("plugins.lualine_extensions.neo-tree"),
        require("plugins.lualine_extensions.quickfix"),
      },
    },
  },
}
