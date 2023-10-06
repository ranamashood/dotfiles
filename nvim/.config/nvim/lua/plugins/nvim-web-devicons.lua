return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        asm = {
          icon = "",
          color = "#e7464d",
          cterm_color = "65",
          name = "Zsh",
        },
      },
    })
  end,
}
