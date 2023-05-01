---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<leader>x"] = "",
    ["<leader>ca"] = "",
    ["<leader>cc"] = "",
    ["<leader>ch"] = "",
    ["<leader>cm"] = "",
    ["<leader>f"] = "",
    ["<leader>fa"] = "",
    ["<leader>fb"] = "",
    ["<leader>fd"] = "",
    ["<leader>ff"] = "",
    ["<leader>fh"] = "",
    ["<leader>fm"] = "",
    ["<leader>fo"] = "",
    ["<leader>fs"] = "",
    ["<leader>fw"] = "",
    ["<leader>fz"] = "",
    ["<leader>ra"] = "",
    ["<leader>rh"] = "",
    ["<leader>rn"] = "",
    ["<leader>th"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>c"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },

    -- code runner
    ["<leader>rr"] = { ":w<CR>:RunCode<CR>", "run code in default setup" },
    ["<leader>rt"] = { ":w<CR>:RunFile tab<CR>", "run code in tab" },
    ["<leader>rb"] = { ":w<CR>:RunFile buf<CR>", "run code in buffer" },
    ["<leader>rf"] = { ":w<CR>:RunFile float<CR>", "run code in floating term" },

    -- lsp
    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "rename",
    },
    ["<leader>la"] = {
      -- function()
      --   vim.lsp.buf.code_action()
      -- end,
      ":CodeActionMenu<CR>",
      "lsp code_action",
    },

    -- telescope
    ["<leader>ft"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "floating diagnostic",
    },
    ["<leader>ff"] = { ":Telescope find_files<CR>", "find files" },
    ["<leader>fF"] = { ":Telescope current_buffer_fuzzy_find<CR>", "search in current buffer" },
    ["<leader>fT"] = { ":Telescope themes<CR>", "themes" },
    ["<leader>fw"] = { ":Telescope live_grep<CR>", "live grep" },
    ["<leader>fg"] = { ":Telescope grep_string<CR>", "grep string" },
    ["<leader>fs"] = { ":Telescope lsp_document_symbols<CR>", "document symbols" },
    ["<leader>fS"] = { ":Telescope symbols<CR>", "symbols" },
    ["<leader>fe"] = { ":Telescope spell_suggest<CR>", "spell suggest" },
    ["<leader>fu"] = { ":Telescope resume<CR>", "resume" },
    ["<leader>fR"] = { ":Telescope registers<CR>", "registers" },
    ["<leader>fm"] = { ":Telescope marks<CR>", "marks" },
    ["<leader>fM"] = { ":Telescope man_pages<CR>", "man pages" },
    ["<leader>fh"] = { ":Telescope help_tags<CR>", "help tags" },
    ["<leader>fH"] = { ":Telescope search_history<CR>", "search history" },
    ["<leader>fc"] = { ":Telescope command_history<CR>", "command history" },
    ["<leader>fv"] = { ":Telescope vim_options<CR>", "vim options" },
    ["<leader>fk"] = { ":Telescope keymaps<CR>", "keymaps" },
    ["<leader>fj"] = { ":Telescope jumplist<CR>", "jumplist" },
    ["<leader>fd"] = { ":Telescope diagnostics<CR>", "diagnostics" },
    ["<leader>fq"] = { ":Telescope quickfix<CR>", "quickfix" },
    ["<leader>fQ"] = { ":Telescope quickfixhistory<CR>", "quickfix history" },
    ["<leader>fp"] = { ":Telescope pickers<CR>", "pickers" },
    ["<leader>fb"] = { ":Telescope builtin<CR>", "builtin" },
    ["<leader>fl"] = { ":Telescope loclist<CR>", "loclist" },
    ["<leader>fr"] = { ":Telescope lsp_references<CR>", "lsp references" },
    ["<leader>fo"] = { ":Telescope oldfiles<CR>", "old files" },

    -- vimtex
    ["<leader>ml"] = {
      ":VimtexCompileSS<CR>:sleep 1<CR>:VimtexClean<CR>",
      "compile tex file to pdf",
    },
    ["<leader>mv"] = {
      ":VimtexView<CR>",
      "View latex as pdf",
    },

    -- trouble
    ["<leader>tx"] = { ":TroubleToggle<cr>", "toggle" },
    ["<leader>tw"] = { ":TroubleToggle workspace_diagnostics<cr>", "workspace diagnostics" },
    ["<leader>td"] = { ":TroubleToggle document_diagnostics<cr>", "document diagnostics" },
    ["<leader>tq"] = { ":TroubleToggle quickfix<cr>", "quickfix" },
    ["<leader>tl"] = { ":TroubleToggle loclist<cr>", "loclist" },
    ["<leader>tr"] = { ":TroubleToggle lsp_references<cr>", "references" },
  },
}

M.tabufline = {
  n = {
    ["<S-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "previous buffer",
    },
    ["<S-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "new buffer",
    },
    ["<M-S-h>"] = {
      function()
        require("nvchad_ui.tabufline").move_buf(-1)
      end,
      "move buffer to left",
    },
    ["<M-S-l>"] = {
      function()
        require("nvchad_ui.tabufline").move_buf(1)
      end,
      "move buffer to right",
    },
  },
}

M.apps = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

-- more keybinds!

return M
