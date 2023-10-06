vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {
  backup = false,
  writebackup = false,
  swapfile = false,
  undofile = true,
  clipboard = "unnamedplus",
  ignorecase = true,
  smartcase = true,
  fileencoding = "utf-8",
  termguicolors = true,
  number = true,
  relativenumber = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  showmode = false,
  updatetime = 300,
}

for opt, val in pairs(opts) do
  vim.o[opt] = val
end

local icons = require("helpers.icons")

local signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
  { name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning },
  { name = "DiagnosticSignHint", text = icons.diagnostics.BoldHint },
  { name = "DiagnosticSignInfo", text = icons.diagnostics.BoldInformation },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  signs = {
    active = signs,
  },
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.wo.fillchars = "eob: "

-- local colorscheme = require("helpers.colorscheme")
-- vim.cmd.colorscheme(colorscheme)
-- vim.cmd("colorscheme tokyonight-night")
