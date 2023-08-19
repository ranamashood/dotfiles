-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true

lvim.colorscheme = "tokyonight-night"
lvim.format_on_save = true

lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<M-S-h>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<M-S-l>"] = ":BufferLineMoveNext<CR>"

lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.builtin.terminal.open_mapping = "<M-v>"

lvim.builtin.which_key.mappings["la"] = { ":CodeActionMenu<CR>", "Code Action" }

lvim.plugins = {
  -- { "wakatime/vim-wakatime" }
  {
    "aurum77/live-server.nvim",
    build = function()
      require "live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require 'nvim-lastplace'.setup {}
    end
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {
        widget_guides = {
          enabled = true,
        },
      }
    end,
  },
  {
    "nvim-orgmode/orgmode",
    lazy = false,
    config = function()
      -- Load custom treesitter grammar for org filetype
      require('orgmode').setup_ts_grammar()

      -- Treesitter configuration
      require('nvim-treesitter.configs').setup {
        -- If TS highlights are not enabled at all, or disabled via `disable` prop,
        -- highlighting will fallback to default Vim syntax highlighting
        highlight = {
          enable = true,
          -- Required for spellcheck, some LaTex highlights and
          -- code block highlights that do not have ts grammar
          additional_vim_regex_highlighting = { 'org' },
        },
        ensure_installed = { 'org' }, -- Or run :TSUpdate org
      }

      require('orgmode').setup({
        org_agenda_files = { '~/org' },
      })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require 'nvim-treesitter.configs'.setup {
        autotag = {
          enable = true,
        }
      }
      require('nvim-ts-autotag').setup()
    end
  }
}

local dap = require('dap')

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = os.getenv("HOME") .. '/.local/share/lvim/mason/bin/codelldb',
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      return vim.fn.getcwd() .. '/builtFile'
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettierd",
    filetypes = { "typescript", "typescriptreact", "css" },
  },
  {
    name = "csharpier",
    filetypes = { "cs" },
  },
}


local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "astro,css,eruby,html,htmldjango,javascriptreact,less,pug,sass,scss,svelte,typescriptreact,vue",
  callback = function()
    vim.lsp.start({
      cmd = { "emmet-language-server", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
      init_options = {
        --- @type table<string, any> https://docs.emmet.io/customization/preferences/
        preferences = {},
        --- @type "always" | "never" defaults to `"always"`
        showexpandedabbreviation = "always",
        --- @type boolean defaults to `true`
        showabbreviationsuggestions = true,
        --- @type boolean defaults to `false`
        showsuggestionsassnippets = false,
        --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
        syntaxprofiles = {},
        --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
        variables = {},
        --- @type string[]
        excludelanguages = {},
      },
    })
  end,
})

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "dartls" })

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "csharp-ls" })
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "csharp-ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)
