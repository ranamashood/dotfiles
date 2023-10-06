local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {

  -- webdev stuff
  formatting.deno_fmt,                                                    -- choosed deno for ts/js files cuz its very fast!
  formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes

  -- lua
  formatting.stylua,

  -- cpp
  formatting.clang_format,

  -- tex
  formatting.latexindent,
}

null_ls.setup({
  debug = true,
  sources = sources,
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.tex" },
    -- change spaces to tabs
    command = "retab",
  }),
})
