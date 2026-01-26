local config = {

	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "v1.8.1", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = nil, -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = true, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

	-- Set colorscheme
	colorscheme = "default_theme",

	-- Override highlight groups in any theme
	highlights = {
		-- duskfox = { -- a table of overrides
		--   Normal = { bg = "#000000" },
		-- },
		default_theme = function(highlights) -- or a function that returns one
			local C = require("default_theme.colors")

			highlights.Normal = { fg = C.fg, bg = C.bg }
			return highlights
		end,
	},

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			relativenumber = true, -- sets vim.opt.relativenumber
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
		},
	},

	-- Default theme configuration
	default_theme = {
		diagnostics_style = { italic = true },
		-- Modify the color table
		colors = {
			fg = "#abb2bf",
		},
		plugins = { -- enable or disable extra plugin highlighting
			aerial = true,
			beacon = false,
			bufferline = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},

	-- Disable AstroNvim ui features
	ui = {
		nui_input = true,
		telescope_select = true,
	},

	-- Configure plugins
	plugins = {
		-- Add plugins, the packer syntax without the "use"
		init = {
			-- disable default plugins
			["Shatur/neovim-session-manager"] = { disable = true },
			["stevearc/aerial.nvim"] = { disable = true },
			["declancm/cinnamon.nvim"] = { disable = true },

			-- add new plugins
			{
				"ray-x/lsp_signature.nvim",
				event = "BufRead",
				config = function()
					require("lsp_signature").setup()
				end,
			},
			{ "tpope/vim-surround" },
			{
				"folke/zen-mode.nvim",
				config = function()
					require("zen-mode").setup({
						window = {
							width = 800,
						},
					})
				end,
			},
			{
				"folke/twilight.nvim",
				config = function()
					require("twilight").setup({})
				end,
			},
			{
				"karb94/neoscroll.nvim",
				config = function()
					require("neoscroll").setup()
				end,
			},
			{
				"folke/todo-comments.nvim",
				requires = "nvim-lua/plenary.nvim",
				config = function()
					require("todo-comments").setup()
				end,
			},
		},
		-- customize default plugins setup
		alpha = function(config)
			local buttons = config.layout[4].val
			local new_file = buttons[4]

			table.remove(buttons, 1)
			table.insert(buttons, 1, new_file)

			table.remove(buttons, 6)
			table.remove(buttons, 5)
			table.remove(buttons, 4)
			table.remove(buttons, 3)

			return config
		end,
		telescope = function(config)
			local actions = require("telescope.actions")
			config.defaults.mappings.i["<C-j>"] = nil
			config.defaults.mappings.i["<C-l>"] = nil

			config.defaults.mappings.i["<C-k>"] = actions.move_selection_next
			config.defaults.mappings.i["<C-l>"] = actions.move_selection_previous

			return config
		end,
		-- All other entries override the setup() call for default plugins
		["null-ls"] = function(config)
			local null_ls = require("null-ls")
			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
			}
			-- set up null-ls's on_attach function
			config.on_attach = function(client)
				-- NOTE: You can remove this on attach function to disable format on save
				if client.resolved_capabilities.document_formatting then
					vim.api.nvim_create_autocmd("BufWritePre", {
						desc = "Auto format before save",
						pattern = "<buffer>",
						callback = vim.lsp.buf.formatting_sync,
					})
				end
			end
			return config -- return final config table
		end,
		treesitter = {
			ensure_installed = { "lua" },
		},
		-- use mason-lspconfig to configure LSP installations
		["mason-lspconfig"] = {
			ensure_installed = { "sumneko_lua" },
		},
		-- use mason-tool-installer to configure DAP/Formatters/Linter installation
		["mason-tool-installer"] = {
			ensure_installed = { "prettierd", "stylua" },
		},
		packer = {
			compile_path = vim.fn.stdpath("data") .. "/packer_compiled.lua",
		},
	},

	-- LuaSnip Options
	luasnip = {
		-- Add paths for including more VS Code style snippets in luasnip
		vscode_snippet_paths = {},
		-- Extend filetypes
		filetype_extend = {
			javascript = { "javascriptreact" },
		},
	},

	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	-- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
		-- easily add or disable built in mappings added during LSP attaching
		mappings = {
			n = {
				-- ["<leader>lf"] = false -- disable formatting keymap
			},
		},
		-- add to the server on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the lsp installer server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = {
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({}))
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- Mapping data with "desc" stored directly by vim.keymap.set().
	--
	-- Please use this mappings table to set keyboard mapping since this is the
	-- lower level configuration and more robust one. (which-key will
	-- automatically pick-up stored data by this setting.)
	mappings = {
		-- first key is the mode
		n = {
			-- Disable some defaults
			["<S-l>"] = false, -- buffer navigation
			["<S-h>"] = false, -- buffer navigation
			[">b"] = false, -- buffer navigation
			["<b"] = false, -- buffer navigation
			["<S-{>"] = false,
			["<S-}>"] = false,
			["<leader>S."] = false, -- session stuff
			["<leader>Sd"] = false, -- session stuff
			["<leader>Sf"] = false, -- session stuff
			["<leader>Sl"] = false, -- session stuff
			["<leader>Ss"] = false, -- session stuff
			["<leader>sb"] = false, -- search stuff. It was remapped to capital S
			["<leader>sh"] = false, -- search stuff. It was remapped to capital S
			["<leader>sm"] = false, -- search stuff. It was remapped to capital S
			["<leader>sn"] = false, -- search stuff. It was remapped to capital S
			["<leader>sr"] = false, -- search stuff. It was remapped to capital S
			["<leader>sk"] = false, -- search stuff. It was remapped to capital S
			["<leader>sc"] = false, -- search stuff. It was remapped to capital S
			-- using <leader>u to run a RemoveDiacritics
			-- ["<leader>u"] = false, -- toggle url highlights
			["<leader>d"] = false, -- alpha dashboard
			["<leader>bb"] = false, -- new tab
			["<leader>bj"] = false, -- pick buffer to jump
			["<leader>bt"] = false, -- sort tabs
			["<leader>e"] = false, -- toggle explorer
			["<leader>w"] = false, -- write
			["<leader>tn"] = false, -- node repl
			["<leader>tp"] = false, -- python repl
			["<C-h>"] = false, -- move cursor to left panel
			["<C-j>"] = false, -- move cursor to bottom panel
			["<C-k>"] = false, -- move cursor to upper panel
			["<C-l>"] = false, -- move cursor to right panel
			["<leader>q"] = false, -- quit nvim

			-- Navigation keys
			["j"] = "h",
			["k"] = "j",
			["l"] = "k",
			[";"] = "l",

			-- Better window navigation
			["<M-j>"] = {
				function()
					require("smart-splits").move_cursor_left()
				end,
				desc = "Move to left split",
			},
			["<M-k>"] = {
				function()
					require("smart-splits").move_cursor_down()
				end,
				desc = "Move to below split",
			},
			["<M-l>"] = {
				function()
					require("smart-splits").move_cursor_up()
				end,
				desc = "Move to above split",
			},
			["<M-;>"] = {
				function()
					require("smart-splits").move_cursor_right()
				end,
				desc = "Move to right split",
			},

			-- Resize with arrows
			["<M-Up>"] = {
				function()
					require("smart-splits").resize_up()
				end,
				desc = "Resize split up",
			},
			["<M-Down>"] = {
				function()
					require("smart-splits").resize_down()
				end,
				desc = "Resize split down",
			},
			["<M-Left>"] = {
				function()
					require("smart-splits").resize_left()
				end,
				desc = "Resize split left",
			},
			["<M-Right>"] = {
				function()
					require("smart-splits").resize_right()
				end,
				desc = "Resize split right",
			},

			-- Buffers
			["<leader>b"] = { ":tabnew<cr>", desc = "New buffer" },
			["<leader>c"] = { ":Bdelete<cr>", desc = "Close buffer" },
			["<leader>r"] = { ":e<cr>", desc = "Refresh buffer" },
			["<m-,>"] = { ":BufferLineCyclePrev<cr>" },
			["<m-.>"] = { ":BufferLineCycleNext<cr>" },
			["<m-<>"] = { ":BufferLineMovePrev<cr>" },
			["<m->>"] = { ":BufferLineMoveNext<cr>" },

			-- Line utils
			["<leader>O"] = { "O<esc>", desc = "New line above" },
			["<leader>o"] = { "o<esc>S<esc>", desc = "New line below" },
			["<leader>s"] = "S<esc>",
			[">"] = ">>",
			["<"] = "<<",

			-- Write
			["<leader>ww"] = { ":w<cr>", desc = "Save" },
			["<leader>wa"] = { ":wa<cr>", desc = "Save all" },
			["<leader>wq"] = { ":wq<cr>", desc = "Save and quit" },

			-- Quit
			["<leader>qq"] = { ":q<cr>", desc = "Quit" },
			["<leader>q!"] = { ":q!<cr>", desc = "Force quit" },

			-- Editor
			["<leader>ee"] = { ":Neotree toggle<cr>", desc = "Explorer" },
			["<leader>ez"] = { ":ZenMode<cr>", desc = "Zen mode" },

			-- Open config file
			["<leader>;"] = { ":edit ~/.config/nvim/lua/user/init.lua<cr>", desc = "Open config file" },

			-- Terminal
			["<m-t>"] = { ":ToggleTerm<cr>", desc = "Toggle terminal" },

			-- Search
			["<leader>Sb"] = {
				function()
					require("telescope.builtin").git_branches()
				end,
				desc = "Git branches",
			},
			["<leader>Sh"] = {
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Search help",
			},
			["<leader>Sm"] = {
				function()
					require("telescope.builtin").man_pages()
				end,
				desc = "Search man",
			},
			["<leader>Sn"] = {
				function()
					require("telescope").extensions.notify.notify()
				end,
				desc = "Search notifications",
			},
			["<leader>Sr"] = {
				function()
					require("telescope.builtin").registers()
				end,
				desc = "Search registers",
			},
			["<leader>Sk"] = {
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Search keymaps",
			},
			["<leader>Sc"] = {
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Search commands",
			},

			-- Diacritics
			["<leader>u"] = { "viw:RemoveDiacritics<CR>", desc = "Remove diacritics (word)" },
		},
		i = {
			["jk"] = false,
		},
		v = {
			-- Navigation keys
			["j"] = "h",
			["k"] = "j",
			["l"] = "k",
			[";"] = "l",

			-- Diacritics
			["<leader>u"] = { ":'<,'>RemoveDiacritics<CR>", desc = "Remove diacritics (visual)" },
		},
		x = {
			-- Navigation keys
			["j"] = "h",
			["k"] = "j",
			["l"] = "k",
			[";"] = "l",
		},
		o = {
			-- Navigation keys
			["j"] = "h",
			["k"] = "j",
			["l"] = "k",
			[";"] = "l",
		},
		t = {
			-- setting a mapping to false will disable it
			["jk"] = false,
			["<C-h>"] = false,
			["<C-j>"] = false,
			["<C-k>"] = false,
			["<C-l>"] = false,
		},
	},

	-- Modify which-key registration (Use this with mappings table in the above.)
	["which-key"] = {
		-- Add bindings which show up as group name
		register_mappings = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- third key is the key to bring up next level and its displayed
					-- group name in which-key top level menu
					["e"] = { name = "Editor" },
					["q"] = { name = "Quit" },
					["s"] = { name = "Remove line content" },
					["S"] = { name = "Search" },
					["w"] = { name = "Write" },
				},
			},
		},
	},

	-- This function is run last
	-- good place to configuring augroups/autocommands and custom filetypes
	polish = function()
		-- Set key binding
		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})

		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }

		-- RemoveDiacritics ============================ BEGIN =================================== //
		-- require the diacritics helper
		local diacritics = require("user.diacritics")

		-- Create a user command that accepts a range (works with visual selection)
		vim.api.nvim_create_user_command("RemoveDiacritics", function(opts)
			diacritics.remove_range(opts.line1, opts.line2)
		end, { range = true, desc = "Remove Latin diacritics in range" })
		-- RemoveDiacritics ============================ END ===================================== //
	end,
}

return config
