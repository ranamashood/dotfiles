---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  -- theme_toggle = { "kanagawa", "tokyodark" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = { load_on_startup = true },

  statusline = {
    theme = "default",
    separator_style = "round",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
