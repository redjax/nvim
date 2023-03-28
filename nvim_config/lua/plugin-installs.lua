-- Bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Define host environment
local uname = vim.loop.os_uname()
-- Set local env var for OS
local _OS = uname.sysname

-- Install Packer if not installed already
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local packer = require("packer")
local packer_util = require("packer.util")

packer.init({
    -- Default to using opt (as opposed to start) plugins
	opt_default = false,
	display = {
        -- An optional function to open a window for packer's display
		open_fn = packer_util.float,
        -- The symbol for a plugin being installed/updated
		working_sym = "🛠",
        -- The symbol for a plugin with an error in installation/updating
		error_sym = "🧨",
        -- The symbol for a plugin which has completed installation/updating
		done_sym = "🎉",
        -- The symbol for an unused plugin which was removed
		removed_sym = "🔥",
        -- The symbol for a plugin which was moved (e.g. from opt to start)
		moved_sym = "🚀",
        -- The symbol for the header line in packer's display
		header_sym = "━",
        -- Should packer show all update details automatically?
		show_all_info = true,
        -- Border style of prompt popups.
		prompt_border = "double",
	},
})

local use = packer.use
packer.reset()

packer.startup(function()
    -- # Packer
	-- https://github.com/wbthomason/packer.nvim
    use({'wbthomason/packer.nvim'})

	-- https://github.com/nvim-lualine/lualine.nim
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end
	})

    -- # Markdown Preview
	-- https://github.com/iamcco/markdown-preview.nvim
    use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- # Nvim's LSP manager
	-- https://github.com/neovim/nvim-lspconfig
    -- use({
	-- 	"neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		require("plugins.lsp")
	-- 	end,
	-- })

    -- # LSP status manager
	-- https://github.com/j-hui/fidget.nvim
    -- use({
	-- 	"j-hui/fidget.nvim",
	-- 	config = function()
	-- 		require("plugins.fidget-nvim")
	-- 	end,
	-- })

    -- # Auto-completion
	-- https://github.com/hrsh7th/nvim-cmp
    -- use({
	-- 	"hrsh7th/nvim-cmp",
	-- 	config = function()
	-- 		require("plugins.nvim-cmp")
	-- 	end,
	-- 	requires = {
	-- 		-- https://github.com/hrsh7th/cmp-nvim-lsp
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
	-- 		"hrsh7th/cmp-nvim-lsp-signature-help",
	-- 		-- https://github.com/hrsh7th/cmp-buffer
	-- 		"hrsh7th/cmp-buffer",
	-- 		-- https://github.com/hrsh7th/cmp-path
	-- 		"hrsh7th/cmp-path",
	-- 	},
	-- })

	-- # Nvim-treesitter & extensions
	-- if _OS == "Linux" then

	-- 	-- https://github.com/nvim-treesitter/nvim-treesitter
	-- 	use({
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		run = ":TSUpdate",
	-- 		config = function()
	-- 			require("plugins.nvim-treesitter")
	-- 		end,
	-- 	})

	-- else

	use ({
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("plugins.nvim-treesitter")
		end,
	})

	-- end

	-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	})

	-- https://github.com/nvim-treesitter/vim-treesitter-refactor
	use({
		"nvim-treesitter/nvim-treesitter-refactor",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	})

	-- https://github.com/nvim-treesitter/playground
	use({
		"nvim-treesitter/playground",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	})

	-- https://github.com/nvim-treesitter/windwp/nvim-ts-autotag
	use({
		"windwp/nvim-ts-autotag",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	})

	-- https://github.com/theHamsta/nvim-treesitter-pairs

	use({
		"theHamsta/nvim-treesitter-pairs",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
	})

	-- # End nvim-treesitter & extensions

    -- # Preview code
	-- https://github.com/rmagatti/goto-preview
	if _OS == "Linux" then
		use({
			"rmagatti/goto-preview",
			config = function()
				require("plugins.goto-preview")
			end,
		})
	end

    -- # LSP & DAP & Linter & Formatter package manager
	-- https://github.com/williamboman/mason.nvim
	-- use({
	-- 	"williamboman/mason.nvim",
	-- 	config = function()
	-- 		require("plugins.mason-nvim")
	-- 	end,
	-- })

	-- https://github.com/williamboman/mason-lspconfig.nvim
	-- use({
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	config = function()
	-- 		require("plugins.mason-lspconfig-nvim")
	-- 	end,
	-- 	requires = {
	-- 		-- https://github.com/neovim/nvim-lspconfig
	-- 		"neovim/nvim-lspconfig",
	-- 		-- https://github.com/williamboman/mason.nvim
	-- 		"williamboman/mason.nvim",
	-- 	},
	-- })

    -- # Speed up loading Lua modules
	-- https://github.com/lewis6991/impatient.nvim
    use({"lewis6991/impatient.nvim"})

    -- # Keep last position
	-- https://github.com/ethanholz/nvim-lastplace
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("plugins.lastplace")
		end,
	})

    -- Peek lines immediately with :<line_number>
	-- https://github.com/nacro90/numb.nvim
	use({
		"nacro90/numb.nvim",
		config = function()
			require("plugins.numb-nvim")
		end,
	})

    -- # Git plugin
	-- https://github.com/tpope/vim-fugitive
	use({
		"tpope/vim-fugitive",
		config = function()
			require("plugins.fugitive")
		end,
	})

    -- # Display vertical indent lines
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent-blankline")
		end,
	})

    -- # Show git sign: inserted, modified, deleted vs..
	--   also git blamer
	-- https://github.com/lewis6991/gitsigns.nvim
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.git-signs")
		end,
	})

  -- # Insert or delete brackets, parens, quotes in pair.
	-- https://github.com/windwp/nvim-autopairs
	if _OS == "Linux" then
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.autopairs")
			end,
		})
	end

    -- # Icons pack
	-- https://github.com/kyazdani42/nvim-web-devicons
	use({ "nvim-tree/nvim-web-devicons" })

    -- # Buffer closer
	-- https://github.com/Asheq/close-buffers.vim
	-- use({
	-- 	"Asheq/close-buffers.vim",
	-- 	config = function()
	-- 		require("plugins.close-buffers")
	-- 	end,
	-- })

	-- https://github.com/kylechui/nvim-surround
	use({
		"kylechui/nvim-surround",
		config = function()
			require("plugins.surround")
		end,
	})

    -- Popup terminal
	-- https://github.com/akinsho/toggleterm.nvim
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("plugins.toggleterm")
		end,
	})

	-- Git diff preview
	use({
		"sindrets/diffview.nvim",
		config = function()
			require("plugins.diffview")
		end,
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- https://github.com/nvim-lua/plenary.nvim
	--   Lua utils
	use({ "nvim-lua/plenary.nvim" })

	if _OS == "Windows_NT" then
	-- # Telescope & extensions
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("plugins.telescope")
			end,
			requires = { "nvim-lua/plenary.nvim" },
		})

		use ({
			'nvim-telescope/telescope-fzf-native.nvim',
			-- run='cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
			run="make"
		})
	end

	-- https://github.com/nvim-telescope/telescope.nvim
	if _OS == "Linux" then
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("plugins.telescope")
			end,
			requires = { "nvim-lua/plenary.nvim" },
		})

		-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
			requires = {
				"nvim-telescope/telescope.nvim",
			},
		})

		-- https://github.com/nvim-telescope/telescope-symbols.nvim
		use({
			"nvim-telescope/telescope-symbols.nvim",
			requires = {
				"nvim-telescope/telescope.nvim",
			},
		})

		-- https://github.com/nvim-telescope/telescope-github.nvim
		use({
			"nvim-telescope/telescope-github.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
		})

		-- https://github.com/LinArcX/telescope-env.nvim
		use({
			"LinArcX/telescope-env.nvim",
			requires = {
				"nvim-telescope/telescope.nvim",
			},
		})
	end

	-- # End Telescope & extensions

    -- Initialize Packer
    if PACKER_BOOTSTRAP then
		packer.sync()
	end

end)
