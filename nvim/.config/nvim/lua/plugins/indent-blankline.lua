local icons = require("helpers.icons")

return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("indent_blankline").setup({
      char = icons.ui.LineLeft,
      context_char = icons.ui.LineLeft,
      show_trailing_blankline_indent = false,
      use_treesitter = true,
      show_current_context = true,
    })
  end,
}
