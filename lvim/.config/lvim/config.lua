-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true

lvim.colorscheme = "tokyonight-night"
lvim.format_on_save = true

lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<M-S-h>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<M-S-l>"] = ":BufferLineMoveNext<CR>"

lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.builtin.terminal.open_mapping = "<M-v>"

lvim.builtin.which_key.mappings["la"] = { ":CodeActionMenu<CR>", "Code Action" }

lvim.plugins = {
  -- { "wakatime/vim-wakatime" }
  {
    "aurum77/live-server.nvim",
    build = function()
      require "live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }
}
