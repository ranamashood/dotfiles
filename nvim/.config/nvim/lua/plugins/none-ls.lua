return {
  "nvimtools/none-ls.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local null_ls = require("null-ls")

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({
                async = false,
                -- filter = function(client)
                --   -- disable formatting for lua_ls
                --   if client.name == "lua_ls" then
                --     return false
                --   end
                --
                --   -- only enable null-ls for javascript files
                --   if vim.bo.filetype == "javascript" then
                --     return client.name == "null-ls"
                --   end
                --
                --   -- enable all other clients
                --   return true
                -- end,
              })
            end,
          })
        end
      end,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.prettierd.with({
        --   filetypes = {
        --     "html",
        --     "css",
        --   },
        -- }),
        null_ls.builtins.formatting.clang_format.with({
          filetypes = { "c", "cpp" },
        }),
        null_ls.builtins.formatting.fixjson.with({
          filetypes = { "json", "jsonc" },
        }),
        -- null_ls.builtins.formatting.biome.with({
        --   disabled_filetypes = { "json", "jsonc" },
        -- }),
        null_ls.builtins.formatting.black,
        -- null_ls.builtins.diagnostics.markuplint,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.diagnostics.markdownlint,

        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.completion.spell,

        -- null_ls.builtins.code_actions,
        -- null_ls.builtins.diagnostics,
        -- null_ls.builtins.formatting,
        -- null_ls.builtins.hover,
        -- null_ls.builtins.completion,
      },
    })
  end,
}
