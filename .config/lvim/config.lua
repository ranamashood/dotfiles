--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight-night"
-- lvim.colorscheme = "lunar"

-- lvim.builtin.dap.active = true

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
-- lvim.keys.normal_mode["<leader>r"] = ":w<CR>:RunCode<CR>"
lvim.builtin.which_key.mappings["r"] = { ":w<CR>:RunCode<CR>", "Run Code" }
-- lvim.builtin.which_key.mappings["t"]["a"] = { ":ToggleAlternate<CR>", "Toggle Alternate" }
lvim.builtin.which_key.mappings["m"] = {
  name = "+My Keymappings",
  a = { "<cmd>ToggleAlternate<cr>", "Toggle Alternate" },
  e = { "! chmod +x %<cr>", "Make File Executable" },
  m = { "<cmd>MarkdownPreview<cr>", "Opens live markdown viewer" },
}
-- lvim.builtin.which_key.mappings["m"]["e"] = { "<cmd>! chmod +x %<CR>", "Make File Executable" }
-- lvim.builtin.which_key.mappings["e"] = { ":NvimTreeToggle<CR>:setlocal relativenumber<CR>", "Explorer" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
-- lvim.builtin.dap.active = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "beautysh", filetypes = { "sh" } },
  { command = "prettierd", filetypes = { "typescript", "typescriptreact" } },
  { command = "markdownlint", filetypes = { "markdown" } },
  -- { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "markdownlint", filetypes = { "markdown" } },
  --   { command = "flake8", filetypes = { "python" } },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}

-- Additional Plugins
lvim.plugins = {
  -- { "lervag/vimtex" },
  { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' },
  -- { 'vimwiki/vimwiki' },
  { "kylechui/nvim-surround", tag = "*", config = function() require("nvim-surround").setup({}) end },
  { "folke/trouble.nvim" },
  { "aurum77/live-server.nvim" },
  { "xiyaowong/nvim-transparent" },
  { "ziontee113/color-picker.nvim", config = function() require("color-picker") end, },
  { "NvChad/nvim-colorizer.lua" },
  { "windwp/nvim-ts-autotag" },
  { "rmagatti/alternate-toggler" },
  { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, },
  -- { "hail2u/vim-css3-syntax" },
  -- { "styled-components/vim-styled-components" },
  -- { "neoclide/coc.nvim", branch = 'release' },
  -- {
  --   'glacambre/firenvim',
  --   run = function() vim.fn['firenvim#install'](0) end
  -- },
  -- { "glepnir/lspsaga.nvim", branch = "main", config = function() require('lspsaga').setup({}) end, },
  { "ethanholz/nvim-lastplace" },
  { "Shatur/neovim-session-manager", requires = 'nvim-lua/plenary.nvim' },
  {
    "aca/emmet-ls",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig/configs")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      if not lspconfig.emmet_ls then
        configs.emmet_ls = {
          default_config = {
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "eruby",
              "typescriptreact",
              "javascriptreact",
              "svelte",
              "vue",
            },
            root_dir = function(fname)
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end
      lspconfig.emmet_ls.setup({ capabilities = capabilities })
    end,
  },
  -- { "wakatime/vim-wakatime" },
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = { "*.tex" },
--   -- change spaces to tabs
--   command = "retab",
-- })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- vim options
-- vim.g.vimtex_view_method = 'zathura'
-- vim.g.transparent_enabled = true
vim.opt.relativenumber = true

-- plugin configs
require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    cpp = "cd $dir && g++ $fileName -o builtFile && $dir/builtFile",
    -- cpp = "cd $dir && g++ *.cpp -o builtFile && $dir/builtFile",
    -- cpp = "cd $dir && g++ *.cpp -o builtFile && $dir/builtFile -s ~/hdd/ ~/hdd1/",
    -- cpp = "cd $dir && g++ ../*.cpp *.cpp -o builtFile && $dir/builtFile",
    sh = "cd $dir && bash $fileName",
    cs = "cd $dir && dotnet run",
  },
})



-- local dap = require('dap')

-- dap.adapters.python = {
--   type = 'executable';
--   command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
--   args = { '-m', 'debugpy.adapter' };
-- }

-- dap.configurations.python = {
--   {
--     type = 'python';
--     request = 'launch';
--     name = "Launch file";
--     program = "${file}";
--     pythonPath = function()
--       return '/usr/bin/python'
--     end;
--   },
-- }

-- local dap = require('dap')
-- dap.configurations.cpp = {
--   type = 'cpp';
--   request =
-- }




-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- local function sep_os_replacer(str)
--   local result = str
--   local path_sep = package.config:sub(1, 1)
--   result = result:gsub("/", path_sep)
--   return result
-- end

-- local join_path = require("lvim.utils").join_paths

-- local status_ok, dap = pcall(require, "dap")
-- if not status_ok then
--   return
-- end

-- dap.configurations.lua = {
--   {
--     type = "nlua",
--     request = "attach",
--     name = "Neovim attach",
--     host = function()
--       local value = vim.fn.input "Host [127.0.0.1]: "
--       if value ~= "" then
--         return value
--       end
--       return "127.0.0.1"
--     end,
--     port = function()
--       local val = tonumber(vim.fn.input "Port: ")
--       assert(val, "Please provide a port number")
--       return val
--     end,
--   },
-- }

-- -- NOTE: if you want to use `dap` instead of `RustDebuggables` you can use the following configuration
-- if vim.fn.executable "lldb-vscode" == 1 then
--   dap.adapters.lldbrust = {
--     type = "executable",
--     attach = { pidProperty = "pid", pidSelect = "ask" },
--     command = "lldb-vscode",
--     env = { LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES" },
--   }
--   dap.adapters.rust = dap.adapters.lldbrust
--   dap.configurations.rust = {
--     {
--       type = "rust",
--       request = "launch",
--       name = "lldbrust",
--       program = function()
--         local metadata_json = vim.fn.system "cargo metadata --format-version 1 --no-deps"
--         local metadata = vim.fn.json_decode(metadata_json)
--         local target_name = metadata.packages[1].targets[1].name
--         local target_dir = metadata.target_directory
--         return target_dir .. "/debug/" .. target_name
--       end,
--       args = function()
--         local inputstr = vim.fn.input("Params: ", "")
--         local params = {}
--         local sep = "%s"
--         for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
--           table.insert(params, str)
--         end
--         return params
--       end,
--     },
--   }
-- end

-- dap.adapters.go = function(callback, _)
--   local stdout = vim.loop.new_pipe(false)
--   local handle
--   local pid_or_err
--   local port = 38697
--   local opts = {
--     stdio = { nil, stdout },
--     args = { "dap", "-l", "127.0.0.1:" .. port },
--     detached = true,
--   }
--   handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
--     stdout:close()
--     handle:close()
--     if code ~= 0 then
--       print("dlv exited with code", code)
--     end
--   end)
--   assert(handle, "Error running dlv: " .. tostring(pid_or_err))
--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       vim.schedule(function()
--         require("dap.repl").append(chunk)
--       end)
--     end
--   end)
--   -- Wait for delve to start
--   vim.defer_fn(function()
--     callback { type = "server", host = "127.0.0.1", port = port }
--   end, 100)
-- end
-- -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- dap.configurations.go = {
--   {
--     type = "go",
--     name = "Debug",
--     request = "launch",
--     program = "${file}",
--   },
--   {
--     type = "go",
--     name = "Debug test", -- configuration for debugging test files
--     request = "launch",
--     mode = "test",
--     program = "${file}",
--   },
--   -- works with go.mod packages and sub packages
--   {
--     type = "go",
--     name = "Debug test (go.mod)",
--     request = "launch",
--     mode = "test",
--     program = "./${relativeFileDirname}",
--   },
-- }

-- dap.configurations.dart = {
--   {
--     type = "dart",
--     request = "launch",
--     name = "Launch flutter",
--     dartSdkPath = sep_os_replacer(join_path(vim.fn.expand "~/", "/flutter/bin/cache/dart-sdk/")),
--     flutterSdkPath = sep_os_replacer(join_path(vim.fn.expand "~/", "/flutter")),
--     program = sep_os_replacer "${workspaceFolder}/lib/main.dart",
--     cwd = "${workspaceFolder}",
--   },
-- }
-- local firefox_path = mason_path .. "packages/firefox-debug-adapter/"

-- dap.adapters.firefox = {
--   type = "executable",
--   command = "node",
--   args = {
--     firefox_path .. "dist/adapter.bundle.js",
--   },
-- }

-- local firefoxExecutable = "/usr/bin/firefox"
-- if vim.fn.has "mac" == 1 then
--   firefoxExecutable = "/Applications/Firefox.app/Contents/MacOS/firefox"
-- end
-- local custom_adapter = "pwa-node-custom"
-- dap.adapters[custom_adapter] = function(cb, config)
--   if config.preLaunchTask then
--     local async = require "plenary.async"
--     local notify = require("notify").async

--     async.run(function()
--       ---@diagnostic disable-next-line: missing-parameter
--       notify("Running [" .. config.preLaunchTask .. "]").events.close()
--     end, function()
--       vim.fn.system(config.preLaunchTask)
--       config.type = "pwa-node"
--       dap.run(config)
--     end)
--   end
-- end

-- dap.configurations.typescript = {
--   {
--     type = "node2",
--     name = "node attach",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--   },
--   {
--     type = "chrome",
--     name = "Debug with Chrome",
--     request = "attach",
--     program = "${file}",
--     -- cwd = "${workspaceFolder}",
--     -- protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}",
--     -- sourceMaps = true,
--     sourceMapPathOverrides = {
--       -- Sourcemap override for nextjs
--       ["webpack://_N_E/./*"] = "${webRoot}/*",
--       ["webpack:///./*"] = "${webRoot}/*",
--     },
--   },
--   {
--     name = "Debug with Firefox",
--     type = "firefox",
--     request = "launch",
--     reAttach = true,
--     sourceMaps = true,
--     url = "http://localhost:6969",
--     webRoot = "${workspaceFolder}",
--     firefoxExecutable = firefoxExecutable,
--   },
--   {
--     name = "Launch",
--     type = "pwa-node",
--     request = "launch",
--     program = "${file}",
--     rootPath = "${workspaceFolder}",
--     cwd = "${workspaceFolder}",
--     sourceMaps = true,
--     skipFiles = { "<node_internals>/**" },
--     protocol = "inspector",
--     console = "integratedTerminal",
--   },
--   {
--     name = "Attach to node process",
--     type = "pwa-node",
--     request = "attach",
--     rootPath = "${workspaceFolder}",
--     processId = require("dap.utils").pick_process,
--   },
--   {
--     name = "Debug Main Process (Electron)",
--     type = "pwa-node",
--     request = "launch",
--     program = "${workspaceFolder}/node_modules/.bin/electron",
--     args = {
--       "${workspaceFolder}/dist/index.js",
--     },
--     outFiles = {
--       "${workspaceFolder}/dist/*.js",
--     },
--     resolveSourceMapLocations = {
--       "${workspaceFolder}/dist/**/*.js",
--       "${workspaceFolder}/dist/*.js",
--     },
--     rootPath = "${workspaceFolder}",
--     cwd = "${workspaceFolder}",
--     sourceMaps = true,
--     skipFiles = { "<node_internals>/**" },
--     protocol = "inspector",
--     console = "integratedTerminal",
--   },
--   {
--     name = "Compile & Debug Main Process (Electron)",
--     type = custom_adapter,
--     request = "launch",
--     preLaunchTask = "npm run build-ts",
--     program = "${workspaceFolder}/node_modules/.bin/electron",
--     args = {
--       "${workspaceFolder}/dist/index.js",
--     },
--     outFiles = {
--       "${workspaceFolder}/dist/*.js",
--     },
--     resolveSourceMapLocations = {
--       "${workspaceFolder}/dist/**/*.js",
--       "${workspaceFolder}/dist/*.js",
--     },
--     rootPath = "${workspaceFolder}",
--     cwd = "${workspaceFolder}",
--     sourceMaps = true,
--     skipFiles = { "<node_internals>/**" },
--     protocol = "inspector",
--     console = "integratedTerminal",
--   },
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Debug Jest Tests",
--     -- trace = true, -- include debugger info
--     runtimeExecutable = "node",
--     runtimeArgs = {
--       "./node_modules/jest/bin/jest.js",
--       "--runInBand",
--     },
--     rootPath = "${workspaceFolder}",
--     cwd = "${workspaceFolder}",
--     console = "integratedTerminal",
--     internalConsoleOptions = "neverOpen",
--   },
-- }

-- dap.configurations.typescriptreact = dap.configurations.typescript
-- dap.configurations.javascript = dap.configurations.typescript
-- dap.configurations.javascriptreact = dap.configurations.typescript

-- --Java debugger adapter settings
-- dap.configurations.java = {
--   {
--     name = "Debug (Attach) - Remote",
--     type = "java",
--     request = "attach",
--     hostName = "127.0.0.1",
--     port = 5005,
--   },
--   {
--     name = "Debug Non-Project class",
--     type = "java",
--     request = "launch",
--     program = "${file}",
--   },
-- }

-- local path = vim.fn.glob(mason_path .. "packages/codelldb/extension/")
--     or vim.fn.expand "~/" .. ".vscode/extensions/vadimcn.vscode-lldb-1.8.1/"
-- local lldb_cmd = path .. "adapter/codelldb"

-- dap.adapters.codelldb = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     -- CHANGE THIS to your path!
--     command = lldb_cmd,
--     args = { "--port", "${port}" },

--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   },
-- }

-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = true,
--   },
-- }

require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })


require 'nvim-lastplace'.setup {
  lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
  lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
  lastplace_open_folds = true
}


local Path = require('plenary.path')
require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  },
  autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 0, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})


local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

require("color-picker").setup({ -- for changing icons & mappings
  -- ["icons"] = { "ﱢ", "" },
  -- ["icons"] = { "ﮊ", "" },
  -- ["icons"] = { "", "ﰕ" },
  -- ["icons"] = { "", "" },
  -- ["icons"] = { "", "" },
  ["icons"] = { "ﱢ", "" },
  ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
  ["keymap"] = { -- mapping example:
    ["U"] = "<Plug>ColorPickerSlider5Decrease",
    ["O"] = "<Plug>ColorPickerSlider5Increase",
  },
  ["background_highlight_group"] = "Normal", -- default
  ["border_highlight_group"] = "FloatBorder", -- default
  ["text_highlight_group"] = "Normal", --default
})

vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.

require('nvim-ts-autotag').setup()

require("alternate-toggler").setup {
  alternates = {
    ["=="] = "!="
  }
}

require("colorizer").setup {
  filetypes = { "*" },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = true, -- 0xAARRGGBB hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes for `mode`: foreground, background,  virtualtext
    mode = "background", -- Set the display mode.
    -- Available methods are false / true / "normal" / "lsp" / "both"
    -- True is same as normal
    tailwind = false, -- Enable tailwind colors
    -- parsers can contain values used in |user_default_options|
    sass = { enable = false, parsers = { css }, }, -- Enable sass colors
    virtualtext = "■",
  },
  -- all the sub-options of filetypes apply to buftypes
  buftypes = {},
}
