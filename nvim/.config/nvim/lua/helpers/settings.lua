local M = {}

M.lsps = {
  "lua_ls",
  "clangd",
  "html",
  "cssls",
  "tsserver",
  "jsonls",
  "pyright",
  "neocmake",
  "emmet_language_server",
  "rust_analyzer",
}

M.mason_tools_ensured_installed = {

  -- formatters
  "stylua",
  "prettier",
  "prettierd",
  "clang-format",
  "fixjson",
  "biome",
  "black",
  "cmakelang",

  -- linters
  "markuplint",
  "markdownlint",
}

M.treesitter_ensure_installed = {
  "lua",
  "cpp",
  "html",
  "css",
  "javascript",
  "typescript",
  "vim",
  "regex",
  "lua",
  "bash",
  "markdown",
  "markdown_inline",
  "tsx",
  "query",
  "make",
  "cmake",
}

return M
