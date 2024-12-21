-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local set = vim.keymap.set
local del = vim.keymap.del

del("n", "<leader>l")
del("n", "<leader>L")
-- del({ "n", "v" }, "<leader>cf")
del("n", "<leader>cd")

set("n", "<leader>a", "<cmd>Lazy<cr>", { desc = "Lazy" })
set("n", "<leader>A", function()
  Util.news.changelog()
end, { desc = "LazyVim Changelog" })
set({ "n", "v" }, "<leader>lf", function()
  Util.format({ force = true })
end, { desc = "Format" })
set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
set("n", "<leader>pp", "<cmd>TransparentToggle<cr>", { desc = "toggle transparent" })
-- set("n", "<leader>ls", "<cmd>Lspsaga outline<cr>", { desc = "Outline" })

local wk = require("which-key")
wk.register({
  l = { name = "lsp" },
  h = { name = "git" },
  g = { name = "lazygit" },
}, { prefix = "<leader>" })

if vim.g.vscode then
  local vscode = require("vscode-neovim")
  -- find
  set("n", "gD", function()
    vscode.call("myabtisx-command-gotojava")
  end)
  set({ "n", "v" }, "<leader>ff", function()
    vscode.call("workbench.action.quickOpen")
  end)
  set({ "n", "v" }, "<leader>fw", function()
    vscode.call("workbench.action.showAllSymbols")
  end)
  set({ "n", "v" }, "<leader>fs", function()
    vscode.call("workbench.action.gotoSymbol")
  end)
  -- git
  set({ "n", "v" }, "<leader>hr", function()
    vscode.call("git.revertSelectedRanges")
  end)
  set("n", "<leader>hS", function()
    vscode.call("git.stage")
  end)
  set({ "n", "v" }, "<leader>hs", function()
    vscode.call("git.stageSelectedRanges")
  end)
  set("n", "<leader>hU", function()
    vscode.call("git.unstage")
  end)
  set({ "n", "v" }, "<leader>hu", function()
    vscode.call("git.unstageSelectedRanges")
  end)
  set("n", "<leader>hd", function()
    vscode.call("git.openChange")
  end)
  set("n", "<leader>e", function()
    vscode.call("workbench.view.explorer")
  end)
  set("n", "gf", function()
    vscode.call("editor.action.openLink")
  end)
  set("n", "gi", function()
    vscode.call("editor.action.goToImplementation")
  end)
  set("n", "gr", function()
    vscode.call("editor.action.goToReferences")
  end)
  set("n", "<leader>r", function()
    vscode.call("workbench.action.openRecent")
  end)
  set("n", "<leader>r", function()
    vscode.call("workbench.action.openRecent")
  end)
  set("n", "<leader>lr", function()
    vscode.call("editor.action.rename")
  end)
  set("n", "<leader>la", function()
    vscode.call("editor.action.quickFix")
  end)
  set("n", "<leader>lf", function()
    vscode.call("editor.action.formatDocument")
  end)
  --vscode scrolling
  set("n", "zl", function()
    vscode.call("toggleTypewriter")
  end)
  set("n", "[c", function()
    vscode.call("workbench.action.editor.previousChange")
  end)
  set("n", "]c", function()
    vscode.call("workbench.action.editor.nextChange")
  end)
  set("n", "[e", function()
    vscode.call("editor.action.marker.prev")
  end)
  set("n", "]e", function()
    vscode.call("editor.action.marker.next")
  end)
  --vscode folding
  set("n", "za", function()
    vscode.call("editor.toggleFold")
  end)
  set("n", "zC", function()
    vscode.call("editor.foldAll")
  end)
  set("n", "zO", function()
    vscode.call("editor.unfoldAll")
  end)
  set("n", "zp", function()
    vscode.call("editor.gotoParentFold")
  end)
  set("n", "zk", function()
    vscode.call("editor.goNextFold")
  end)
  set("n", "zj", function()
    vscode.call("editor.goPreviousFold")
  end)
end
