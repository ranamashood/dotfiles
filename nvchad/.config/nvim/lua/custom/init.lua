-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local g = vim.g

opt.relativenumber = true
opt.wrap = false
opt.swapfile = false

-- org links formatting
-- opt.conceallevel = 2
-- opt.concealcursor = "nc"

opt.fileencoding = "utf-8"
opt.scrolloff = 8

opt.guifont = { "FiraCode Nerd Font", ":h11" }

g.vscode_snippets_path = "/home/mashood/.config/nvim/lua/custom/configs/my_snippets/"

g.vimtex_view_method = "zathura_simple"
