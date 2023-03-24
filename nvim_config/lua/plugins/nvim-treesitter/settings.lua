require("nvim-treesitter.configs").setup({

	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			--normal mode
			init_selection = "<S-Tab>",
			--visual mode
			node_incremental = "<Tab>",
			--visual mode
			node_decremental = "<S-Tab>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		},
	},
	playground = {
		enable = true,
		disable = {},
		-- Debounced time for highlighting nodes in the playground from source code
		updatetime = 25,
		-- Whether the query persists across vim sessions
		persist_queries = false,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		config = {
			javascriptreact = { style_element = "{/*%s*/}" },
		},
	},
	pairs = {
		enable = true,
		disable = {},
		-- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
		highlight_pair_events = {},
		-- whether to highlight also the part of the pair under cursor (or only the partner)
		highlight_self = false,
		-- whether to go to the end of the right partner or the beginning
		goto_right_end = false,
		-- What command to issue when we can't find a pair (e.g. "normal! %")
		fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')",
		keymaps = nil,
		delete_balanced = {
			-- whether to trigger balanced delete when on first character of a pair
			only_on_first_char = false,
			-- fallback command when no pair found, can be nil
			fallback_cmd_normal = nil,
			-- whether to delete the longest or the shortest pair when multiple found.
			longest_partner = false,
			-- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
		},
	},
})
