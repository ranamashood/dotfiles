return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local colorscheme = require("helpers.colorscheme")
      vim.cmd.colorscheme(colorscheme)
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },
  -- {
  -- 	"ellisonleao/gruvbox.nvim",
  -- 	priority = 1000,
  -- },
  -- {
  -- 	"navarasu/onedark.nvim",
  -- 	priority = 1000,
  -- 	config = function()
  -- 		require("onedark").setup({
  -- 			style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  -- 		})
  -- 	end,
  -- },
  -- {
  -- 	"EdenEast/nightfox.nvim",
  -- 	priority = 1000,
  -- },
  -- {
  -- 	"marko-cerovac/material.nvim",
  -- 	priority = 1000,
  -- },
  -- {
  -- 	"rebelot/kanagawa.nvim",
  -- 	priority = 1000,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          all = {
            base = "#11111b",
          },
        },
      })
    end,
  },
  -- {
  -- 	"Mofiqul/vscode.nvim",
  -- 	priority = 1000,
  -- },
  -- {
  -- 	"projekt0n/github-nvim-theme",
  -- 	priority = 1000,
  -- },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    priority = 1000,
  },
  -- {
  -- 	"bluz71/vim-nightfly-colors",
  -- 	name = "nightfly",
  -- 	priority = 1000,
  -- },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = false, -- set background to transparent
      gamma = 1.00, -- adjust the brightness of the theme
      styles = {
        comments = { italic = true }, -- style for comments
        keywords = { italic = true }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
      },
      custom_highlights = {} or function(highlights, palette)
        return {}
      end, -- extend highlights
      custom_palette = {} or function(palette)
        return {}
      end, -- extend palette
      terminal_colors = true, -- enable terminal colors
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },
}
