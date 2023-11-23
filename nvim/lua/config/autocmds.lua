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
      hi! link NormalFloat Normal
      hi DapBreakpoint guifg='#993939'
      hi! link WinSeparator Normal
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
    ]])
  end,
})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd([[
      hi! link FloatBorder Normal
      hi! link NormalFloat Normal
      hi DapBreakpoint guifg='#993939'
      hi! link WinSeparator Normal
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
    ]])
  end,
})
