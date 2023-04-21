---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<leader>e"] = "",
    ["<leader>x"] = "",
    ["<leader>ca"] = "",
    ["<leader>cc"] = "",
    ["<leader>ch"] = "",
    ["<leader>cm"] = "",
    ["<leader>ra"] = "",
    ["<leader>rh"] = "",
    ["<leader>rn"] = "",
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
    ["<leader>ts"] = {
      ":Telescope lsp_document_symbols<CR>",
      "document symbols",
    },

    -- vimtex
    ["<leader>ml"] = {
      ":VimtexCompileSS<CR>:sleep 1<CR>:VimtexClean<CR>",
      "compile tex file to pdf",
    },
    ["<leader>mv"] = {
      ":VimtexView<CR>",
      "View latex as pdf",
    },
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
