local keymaps = require("core.keymaps")

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    -- vim.o.timeoutlen = 300
    vim.o.timeoutlen = 0
  end,
  opts = {
    window = {
      border = "single",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(keymaps.wk_keymaps, { prefix = "<leader>" })
  end,
}
