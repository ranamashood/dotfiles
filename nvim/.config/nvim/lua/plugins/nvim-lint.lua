return {
  "mfussenegger/nvim-lint",
  lazy = true,
  config = function()
    require("lint").linters_by_ft = {
      -- html = { "markuplint" },
      -- html = { "erb_lint" },
    }
  end,
}
