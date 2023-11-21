local settings = require("helpers.settings")

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "ray-x/lsp_signature.nvim",
    "tamago324/nlsp-settings.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    require("neodev").setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = settings.lsps,
    })
    require("mason-tool-installer").setup({
      ensure_installed = settings.mason_tools_ensured_installed,
    })

    require("lsp_signature").setup()

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    for _, lsp in ipairs(settings.lsps) do
      if lsp == "rust_analyzer" then
        require("rust-tools").setup({ server = { capabilities = capabilities, standalone = true } })
      else
        if lsp == "clangd" then
          capabilities.offsetEncoding = { "utf-16" }
        end
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = function(client)
            if client.name == "dartls" then
              require("null-ls").disable({ "prettier" })
            end
          end,
        })
      end
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  end,
}
