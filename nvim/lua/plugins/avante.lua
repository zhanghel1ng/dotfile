return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "deepseek",
      providers = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
        },
      },
      -- windows = {
      --   position = "bottom",
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   dependencies = { "yetone/avante.nvim", "saghen/blink.compat" },
  --   opts = {
  --     sources = {
  --       compat = { "avante_commands", "avante_mentions", "avante_files" },
  --       providers = {
  --         avante_commands = {
  --           name = "avante_commands",
  --           module = "blink.compat.source",
  --           score_offset = 90, -- show at a higher priority than lsp
  --           opts = {},
  --         },
  --         avante_files = {
  --           name = "avante_files",
  --           module = "blink.compat.source",
  --           score_offset = 100, -- show at a higher priority than lsp
  --           opts = {},
  --         },
  --         avante_mentions = {
  --           name = "avante_mentions",
  --           module = "blink.compat.source",
  --           score_offset = 1000, -- show at a higher priority than lsp
  --           opts = {},
  --         },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   dependencies = {
  --     "Kaiser-Yang/blink-cmp-avante",
  --   },
  --   opts = {
  --     sources = {
  --       default = { "avante"},
  --       providers = {
  --         avante = {
  --           module = "blink-cmp-avante",
  --           name = "Avante",
  --           opts = {
  --             -- options for blink-cmp-avante
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
}
