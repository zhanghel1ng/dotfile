return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      local lsps = { "pyright", "typescript-language-server", "clangd", "html-lsp", "css-lsp", "codelldb" }
      vim.list_extend(opts.ensure_installed, lsps)
    end,
    keys = {
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },
      { "<leader>cm", false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cA", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "<leader>cl", false }
      -- add
      keys[#keys + 1] =
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
      keys[#keys + 1] = {
        "<leader>lA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
        has = "codeAction",
      }
      if require("lazyvim.util").has("inc-rename.nvim") then
        keys[#keys + 1] = {
          "<leader>lr",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename",
          has = "rename",
        }
      else
        keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
      end
      keys[#keys + 1] = { "<leader>ll", "<cmd>LspInfo<cr>", desc = "Lsp Info" }

      -- keys[#keys + 1] = {
      --   "gd",
      --   "<cmd>Lspsaga goto_definition<cr>",
      --   desc = "Goto Definition",
      --   has = "definition",
      -- }
      -- keys[#keys + 1] = { "gr", "<cmd>Lspsaga finder<cr>", desc = "References" }
      -- keys[#keys + 1] = { "gD", "<cmd>Lspsaga peek_definition<cr>", desc = "Goto Declaration" }
      -- keys[#keys + 1] = { "gI", "<cmd>Lspsaga finder imp<cr>", desc = "Goto Implementation" }
      -- keys[#keys + 1] = {
      --   "gy",
      --   "<cmd>Lspsaga goto_type_definition<cr>",
      --   desc = "Goto T[y]pe Definition",
      -- }
    end,
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        tsserver = {},
        vuels = {},
        gopls = {
          mason = false,
        },
        html = {},
        cssls = {},
        rust_analyzer = {
          mason = false,
        },
        clangd = {},
        pyright = {},
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    keys = {
      {
        "<leader>lF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
      { "<leader>cF", false },
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LazyFile",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          in_custom = false,
          enable = false,
          separator = " ",
          show_file = true,
          -- define how to customize filename, eg: %:., %
          -- if not set, use default value `%:t`
          -- more information see `vim.fn.expand` or `expand`
          -- ## only valid after set `show_file = true`
          file_formatter = "",
          click_support = false,
        },
        lightbulb = {
          virtual_text = false,
        },
        ui = {
          code_action = "󰌵",
          -- lines = { "└", "├", "│", "─", "┌" },
          lines = { "", "", "│", "", "" },
        },
        finder = {
          methods = {
            tyd = "textDocument/typeDefinition",
          },
        },
        outline = {
          auto_preview = false,
        },
      })
    end,
    -- keys = {
    --   { "<leader>ls", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
    -- },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "rust", "go", "css", "scss", "html", "vue" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local lspkind = require("lspkind")
      lspkind.init({
        -- symbol_map = require("lazyvim.config").icons.kinds
        -- preset = 'codicons',
      })
      -- opts.formatting = {
      --   format = function(entry, item)
      --     print(entry.source)
      --     local icons = require("lazyvim.config").icons.kinds
      --     item.menu = ""
      --     if icons[item.kind] then
      --       item.kind = icons[item.kind] .. item.kind
      --     end
      --     return item
      --   end,
      -- }
      opts.formatting.format = lspkind.cmp_format({
        with_text = true,
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(_, vim_item)
          -- vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
          vim_item.menu = ""
          return vim_item
        end,
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    },
  },
}
