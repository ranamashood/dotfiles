-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  CursorLine = {
    bg = "black2",
  },
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  Type = {
    fg = "#0db9d7",
  },
  IlluminatedWordText = {
    bg = "one_bg2",
    underline = false,
  },
  IlluminatedWordRead = {
    bg = "one_bg2",
    underline = false,
  },
  IlluminatedWordWrite = {
    bg = "one_bg2",
    underline = false,
  },
  Error = {
    fg = "#A3AACE",
    bg = "NONE",
  },
}

return M
