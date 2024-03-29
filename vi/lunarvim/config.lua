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
lvim.colorscheme = "onedarker"

vim.opt.guifont = "JetBrains Mono:h13"
vim.opt.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<c-s>"] = ":w<cr>"

vim.cmd([[
  " cursor navigation
  nnoremap j h
  nnoremap k j
  nnoremap l k
  nnoremap ; l

  vnoremap j h
  vnoremap k j
  vnoremap l k
  vnoremap ; l

  onoremap j h
  onoremap k j
  onoremap l k
  onoremap ; l

  " system clipboard
  vmap <c-c> "+y
  inoremap <c-v> <c-r>+
  cnoremap <c-v> <c-r>+
  " use <c-r> to insert original character without triggering things like auto-pairs
  " inoremap <c-r> <c-v>
]])

-- unmap a default keymapping
lvim.keys.normal_mode["<a-k>"] = false -- disable 'move line up'
lvim.keys.insert_mode["jj"] = false -- disable 'exit insert mode'
lvim.keys.insert_mode["kj"] = false -- disable 'exit insert mode'
lvim.keys.insert_mode["jk"] = false -- disable 'exit insert mode'
lvim.keys.normal_mode["<c-\\>"] = false
lvim.keys.normal_mode["<s-h>"] = false
lvim.keys.normal_mode["<s-l>"] = false

-- pane navigation
lvim.keys.normal_mode["<a-j>"] = "<c-w>h" -- focus on left panel
lvim.keys.normal_mode["<a-k>"] = "<c-w>j" -- focus on left panel
lvim.keys.normal_mode["<a-l>"] = "<c-w>k" -- focus on left panel
lvim.keys.normal_mode["<a-;>"] = "<c-w>l" -- focus on right panel

-- tab navigation
lvim.keys.normal_mode["<a-,>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<a-.>"] = "<cmd>BufferLineCycleNext<cr>"

lvim.keys.normal_mode["<a-<>"] = "<cmd>BufferLineMovePrev<cr>"
lvim.keys.normal_mode["<a->>"] = "<cmd>BufferLineMoveNext<cr>"

-- indentation
lvim.keys.normal_mode[">"] = ">>"
lvim.keys.normal_mode["<"] = "<<"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-k>"] = actions.move_selection_next,
    ["<C-l>"] = actions.move_selection_previous,
    ["<C-j>"] = actions.cycle_history_next,
    ["<C-;>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-k>"] = actions.move_selection_next,
    ["<C-l>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["e"] = {
  name = "+Editor",
  e = { ":NvimTreeToggle<cr>", "Toggle File Explorer" },
  z = { "<cmd>ZenMode<cr>", "Zen Mode" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble references<cr>", "References" },
  f = { "<cmd>Trouble definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings["w"] = {
  name = "+Save",
  w = { "<cmd>w<cr>", "Save" },
  a = { "<cmd>wa<cr>", "Save all" },
  q = { "<cmd>wq<cr>", "Save and quit" },
}

lvim.builtin.which_key.mappings["q"] = {
  name = "+Quit",
  q = { "<cmd>q!<cr>", "Quit" },
}

lvim.builtin.which_key.mappings["o"] = { "o<esc>", "New line below" }
lvim.builtin.which_key.mappings["O"] = { "O<esc>", "New line above" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 50
lvim.builtin.nvimtree.setup.view.mappings.list = {
  { key = { "l" }, action = "" },
  { key = { "<C-r>" }, action = "" },
  { key = { "<C-v>" }, action = "" },
  { key = { "<C-x>" }, action = "" },
  { key = { "o", ";" }, action = "edit" },
  { key = { "j" }, action = "parent_node" },
  { key = { "r" }, action = "rename" },
  { key = { "-" }, action = "split" },
  { key = { "\\" }, action = "vsplit" },
  { key = { "<CR>" }, action = "cd" },
}
-- autotag plugin (https://github.com/windwp/nvim-ts-autotag/issues/64#issuecomment-1200083102)
lvim.builtin.treesitter.autotag.enable = true

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
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

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
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettierd",
    -- @usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--print-with", "100" },
    args = { "--print-with", "100" },
    -- @usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  -- { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
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
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  { 'rescript-lang/vim-rescript' },
  { 'tpope/vim-surround' },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          width = 400,
        }
      }
    end
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
