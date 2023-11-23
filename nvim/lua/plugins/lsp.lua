return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "shfmt",
        "stylua",
      },
    },
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

      keys[#keys + 1] = {
        "gd",
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "Goto Definition",
        has = "definition",
      }
      keys[#keys + 1] = { "gr", "<cmd>Lspsaga finder<cr>", desc = "References" }
      keys[#keys + 1] = { "gD", "<cmd>Lspsaga peek_definition<cr>", desc = "Goto Declaration" }
      keys[#keys + 1] = { "gI", "<cmd>Lspsaga finder imp<cr>", desc = "Goto Implementation" }
      keys[#keys + 1] = {
        "gy",
        "<cmd>Lspsaga goto_type_definition<cr>",
        desc = "Goto T[y]pe Definition",
      }
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
    "simrat39/symbols-outline.nvim",
    opts = {
      -- relate_width = false,
      width = 24,
    },
    keys = {
      -- { "<leader>ls", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
      { "<leader>cs", false },
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
          auto_preview = false
        }
      })
    end,
    -- keys = {
    --   { "<leader>ls", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
    -- },
  },
}
