vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
    end, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gl", function()
      local float = vim.diagnostic.config().float
      if float then
        local config = type(float) == "table" and float or {}
        config.scope = "line"
        vim.diagnostic.open_float(config)
      end
    end, opts)
  end,
})

vim.keymap.set("n", "<A-S-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-S-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-S-j>", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "<A-S-k>", ":m '<-2<CR>gv-gv")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<S-u>", ":Telescope undo<cr>")

local function map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

local gs = require("gitsigns")

-- Actions
map("n", "<leader>gg", ":LazyGit<cr>", { desc = "Lazygit" })
map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage Hunk" })
map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset Hunk" })
map("v", "<leader>gs", function()
  gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage Hunk" })
map("v", "<leader>gr", function()
  gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset Hunk" })
map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage Buffer" })
map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset Buffer" })
map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview Hunk" })
map("n", "<leader>gb", function()
  gs.blame_line({ full = true })
end, { desc = "Blame Line" })
map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Blame Line" })
map("n", "<leader>gd", gs.diffthis, { desc = "Diff This" })
map("n", "<leader>gD", function()
  gs.diffthis("~")
end, { desc = "Diff This" })
map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle Deleted" })

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")

vim.keymap.set("n", "<leader>c", ":bdelete<cr>")
vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<cr>")
vim.keymap.set("n", "<leader>bs", ":BufferLinePick<cr>")
vim.keymap.set("n", "<leader>bt", ":BufferLineTogglePin<cr>")
vim.keymap.set("n", "<leader>bd", ":BufferLineSortByDirectory<cr>")
vim.keymap.set("n", "<leader>br", ":BufferLineSortByRelativeDirectory<cr>")
vim.keymap.set("n", "<leader>be", ":BufferLineSortByExtension<cr>")
vim.keymap.set("n", "<leader>bg", ":BufferLineSortGroupToggle<cr>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<cr>")
vim.keymap.set("n", "<M-S-h>", ":BufferLineMovePrev<cr>")
vim.keymap.set("n", "<M-S-l>", ":BufferLineMoveNext<cr>")

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end)

vim.keymap.set("n", "<leader>mf", function()
  vim.lsp.buf.format()
end, { desc = "Format" })
vim.keymap.set("n", "<leader>mF", ":Telescope flutter commands<cr>")
vim.keymap.set("n", "<leader>ml", ":LiveServer<cr>")
vim.keymap.set("n", "<leader>mm", ":MarkdownPreviewToggle<cr>")

local M = {}

M.wk_keymaps = {
  s = {
    name = "Search",
    f = { ":Telescope find_files<cr>", "Find File" },
    F = { ":Telescope git_files<cr>", "Find File From Git Files" },
    b = { ":Telescope buffers<cr>", "Find Buffer" },
    t = { ":Telescope live_grep<cr>", "Live Grep" },
    g = { ":Telescope grep_string<cr>", "Grep String" },
    k = { ":Telescope keymaps<cr>", "Keymaps" },
    r = { ":Telescope registers<cr>", "Registers" },
    R = { ":Telescope resume<cr>", "Resume" },
    s = { ":Telescope current_buffer_fuzzy_find<cr>", "fzf" },
    S = { ":Telescope spell_suggest<cr>", "Spell Suggest" },
    T = { ":Telescope treesitter<cr>", "Treesitter" },
  },
  l = {
    name = "LSP",
    -- vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions),
    a = { require("actions-preview").code_actions, "Code Actions" },
    r = { vim.lsp.buf.rename, "Rename" },
    R = { ":Telescope lsp_references<cr>", "References" },
    I = { ":Telescope lsp_incoming_calls<cr>", "Incoming Calls" },
    o = { ":Telescope lsp_outgoing_calls<cr>", "Outcoming Calls" },
    s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
    w = { ":Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
    W = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Dynamic Workspace Symbols" },
    d = {
      function()
        require("telescope.builtin").diagnostics({ bufnr = 0 })
      end,
      "Diagnostics",
    },
    D = { ":Telescope diagnostics<cr>", "Diagnostics" },
    i = { ":Telescope lsp_implementations<cr>", "Implementations" },
    f = { ":Telescope lsp_definitions<cr>", "Definitions" },
    F = { ":Telescope lsp_type_definitions<cr>", "Type Diagnostics" },
  },
  e = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
  h = { ":noh<cr>", "Disable Highlights" },
  t = {
    name = "Toggle",
    a = { ":ToggleAlternate<cr>", "Toggle Alternate" },
  },
  g = {
    name = "Git",
  },
  b = {
    name = "Buffer",
  },
  m = {
    name = "Random",
  },
}

return M
