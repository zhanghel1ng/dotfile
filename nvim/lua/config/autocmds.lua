-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    if vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
      vim.g.clipboard = {
        copy = {
          ["+"] = "win32yank.exe -i --crlf",
          ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
          ["+"] = "win32yank.exe -o --lf",
          ["*"] = "win32yank.exe -o --lf",
        },
      }
    elseif vim.fn.has("unix") == 1 then
      if vim.fn.executable("xclip") == 1 then
        vim.g.clipboard = {
          copy = {
            ["+"] = "xclip -selection clipboard",
            ["*"] = "xclip -selection clipboard",
          },
          paste = {
            ["+"] = "xclip -selection clipboard -o",
            ["*"] = "xclip -selection clipboard -o",
          },
        }
      elseif vim.fn.executable("xsel") == 1 then
        vim.g.clipboard = {
          copy = {
            ["+"] = "xsel --clipboard --input",
            ["*"] = "xsel --clipboard --input",
          },
          paste = {
            ["+"] = "xsel --clipboard --output",
            ["*"] = "xsel --clipboard --output",
          },
        }
      end
    end

    vim.opt.clipboard = "unnamedplus"
  end,
  desc = "Lazy load clipboard",
})
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd([[
      hi! link FloatBorder Normal
      hi! link NeoTreeIndentMarker NeoTreeFadeText1
      " hi! link NormalFloat Normal
      hi DapBreakpoint guifg='#993939'
      " hi! link WinSeparator Normal
      hi! link BqfPreviewFloat Normal
      " hi! link NonText Normal
      hi! link leetcode_normal Normal
      hi! link NoiceCmdlinePopupBorder Normal
      hi! link NoiceCmdlinePopupTitle Normal
      hi! link NoiceCmdlineIcon Normal
      hi DiagnosticSignHint guifg='#FFD700'
      hi DiagnosticSignError guifg='#f85149'
      hi DiagnosticSignWarn guifg='#d29922'
      hi DiagnosticSignInfo guifg=#2f81f7
      hi DiagnosticSignOk guifg=LightGreen
      hi DiagnosticError guifg=#f85149
      hi DiagnosticWarn guifg=#d29922
      hi DiagnosticInfo guifg=#2f81f7
      hi DiagnosticHint guifg=#FFD700
      hi DiagnosticOk ctermfg=10 guifg=LightGreen
      hi DiagnosticUnderlineError cterm=undercurl gui=undercurl guisp=#f85149
      hi DiagnosticUnderlineWarn cterm=undercurl gui=undercurl guisp=#d29922
      hi DiagnosticUnderlineInfo cterm=undercurl gui=undercurl guisp=#2f81f7
      hi DiagnosticUnderlineHint cterm=undercurl gui=undercurl guisp=#FFD700
      hi DiagnosticUnderlineOk cterm=underline gui=underline guisp=LightGreen
      hi DiagnosticVirtualTextError guifg=#f85149
      hi DiagnosticVirtualTextWarn guifg=#d29922
      hi DiagnosticVirtualTextInfo guifg=#2f81f7
      hi DiagnosticVirtualTextHint guifg=#FFD700
      hi! link DiagnosticVirtualTextOk DiagnosticOk
      hi! link DiagnosticFloatingError DiagnosticError
      hi! link DiagnosticFloatingWarn  DiagnosticWarn
      hi! link DiagnosticFloatingInfo  DiagnosticInfo
      hi! link DiagnosticFloatingHint  DiagnosticHint
      hi! link DiagnosticFloatingOk  DiagnosticOk
      hi! link SnacksIndent IndentBlankLineChar
      hi! link SnacksIndentScope IndentBlankLineContextChar
    ]])
  end,
})
vim.cmd([[
      hi! link FloatBorder Normal
      " hi! link NormalFloat Normal
      hi DapBreakpoint guifg='#993939'
      " hi! link WinSeparator Normal
      " hi! link NonText Normal
      hi! link leetcode_normal Normal
      hi! link NoiceCmdlinePopupBorder Normal
      hi! link NoiceCmdlinePopupTitle Normal
      hi! link NoiceCmdlineIcon Normal
      hi! link NeoTreeIndentMarker NeoTreeFadeText1
      hi DiagnosticSignHint guifg='#FFD700'
      hi DiagnosticSignError guifg='#f85149'
      hi DiagnosticSignWarn guifg='#d29922'
      hi DiagnosticSignInfo guifg=#2f81f7
      hi DiagnosticSignOk guifg=LightGreen
      hi DiagnosticError guifg=#f85149
      hi DiagnosticWarn guifg=#d29922
      hi DiagnosticInfo guifg=#2f81f7
      hi DiagnosticHint guifg=#FFD700
      hi DiagnosticOk ctermfg=10 guifg=LightGreen
      hi DiagnosticUnderlineError cterm=undercurl gui=undercurl guisp=#f85149
      hi DiagnosticUnderlineWarn cterm=undercurl gui=undercurl guisp=#d29922
      hi DiagnosticUnderlineInfo cterm=undercurl gui=undercurl guisp=#2f81f7
      hi DiagnosticUnderlineHint cterm=undercurl gui=undercurl guisp=#FFD700
      hi DiagnosticUnderlineOk cterm=underline gui=underline guisp=LightGreen
      hi DiagnosticVirtualTextError guifg=#f85149
      hi DiagnosticVirtualTextWarn guifg=#d29922
      hi DiagnosticVirtualTextInfo guifg=#2f81f7
      hi DiagnosticVirtualTextHint guifg=#FFD700
      hi! link DiagnosticVirtualTextOk DiagnosticOk
      hi! link DiagnosticFloatingError DiagnosticError
      hi! link DiagnosticFloatingWarn  DiagnosticWarn
      hi! link DiagnosticFloatingInfo  DiagnosticInfo
      hi! link DiagnosticFloatingHint  DiagnosticHint
      hi! link DiagnosticFloatingOk  DiagnosticOk
      hi! link SnacksIndent IndentBlankLineChar
      hi! link SnacksIndentScope IndentBlankLineContextChar
    ]])
-- terminal
--

-- 自动关闭行号和标记列，并进入插入模式
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    -- 关闭行号和标记列
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    -- 自动进入插入模式
    vim.cmd("startinsert")
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    -- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    -- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    -- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    -- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    -- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  end,
})

