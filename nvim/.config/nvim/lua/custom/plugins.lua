local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("custom.configs.null-ls")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    -- config = function()
    --   require("nvim-treesitter.configs").setup {
    --     rainbow = {
    --       enable = true,
    --       -- Which query to use for finding delimiters
    --       query = "rainbow-parens",
    --       -- Highlight the entire buffer all at once
    --       strategy = require("ts-rainbow").strategy.global,
    --     },
    --   }
    -- end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  {
    "nvim-orgmode/orgmode",
    config = function()
      require("orgmode").setup_ts_grammar()
      require("orgmode").setup({
        org_agenda_files = { "~/org/*" },
      })
    end,
    lazy = false,
  },

  {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup()
    end,
    ft = "org",
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        delay = 120,
        filetypes_denylist = {
          "dirvish",
          "fugitive",
          "alpha",
          "NvimTree",
          "packer",
          "neogitstatus",
          "Trouble",
          "lir",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "DressingSelect",
          "TelescopePrompt",
        },
      })
    end,
    lazy = false,
  },

  {
    "CRAG666/code_runner.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("code_runner").setup({
        -- put here the commands by filetype
        filetype = {
          java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          python = "python3 -u",
          typescript = "deno run",
          rust = "cd $dir && cargo run",
          -- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
          -- c = "cd $dir && gcc $fileName -o builtFile && $dir/builtFile",
          c = "cd $dir && gcc *.c -o people && $dir/people",
          cpp = "cd $dir && g++ $fileName -o builtFile && $dir/builtFile",
          -- cpp = "cd $dir && g++ *.cpp -o jk && $dir/jk program.jk",
          -- cpp = "cd $dir && g++ *.cpp -o builtFile && $dir/builtFile -s ~/hdd/ ~/hdd1/",
          -- cpp = "cd $dir && g++ ../*.cpp *.cpp -o builtFile && $dir/builtFile",
          sh = "cd $dir && bash $fileName",
          cs = "cd $dir && dotnet run",
        },
      })
    end,
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup({})
    end,
    lazy = false,
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
    lazy = false,
  },

  -- {
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("auto-save").setup {
  --       -- your config goes here
  --       -- or just leave it empty :)
  --     }
  --   end,
  --   lazy = false,
  -- },

  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          -- CHANGE THIS to your path!
          command = "/home/mashood/.local/share/nvim/mason/bin/codelldb",
          args = { "--port", "${port}" },

          -- On windows you may have to uncomment this:
          -- detached = false,
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end,
    lazy = false,
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
    lazy = false,
    -- priority = 1000,
  },

  {
    "lervag/vimtex",
    lazy = false,
  },

  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
    cmd = { "Trouble", "TroubleToggle" },
  },
}

return plugins
