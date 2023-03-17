-- Bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

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
    -- Packer
    use({'wbthomason/packer.nvim'})
    -- Airline
    use({'vim-airline/vim-airline'})
    use({'vim-airline/vim-airline-themes'})
    -- Markdown Preview
    use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
    -- Nvim's LSP manager
    use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp")
		end,
	})
    -- LSP status manager
    use({
		"j-hui/fidget.nvim",
		config = function()
			require("plugins.fidget-nvim")
		end,
	})
    -- Auto-completion
    use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.nvim-cmp")
		end,
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	})
    -- Preview code
    use({
		"rmagatti/goto-preview",
		config = function()
			require("plugins.goto-preview-nvim")
		end,
	})
    -- LSP & DAP & Linter & Formatter package manager
	use({
		"williamboman/mason.nvim",
		config = function()
			require("plugins.mason-nvim")
		end,
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugins.mason-lspconfig-nvim")
		end,
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
	})
    -- Speed up loading Lua modules
    use({"lewis6991/impatient.nvim"})
    -- Keep last position
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("plugins.lastplace-nvim")
		end,
	})
    -- Peek lines immediately with :<line_number>
	use({
		"nacro90/numb.nvim",
		config = function()
			require("plugins.numb-nvim")
		end,
	})
    -- Git plugin
	use({
		"tpope/vim-fugitive",
		config = function()
			require("plugins.fugitive")
		end,
	})
    -- Display vertical indent lines
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent-blankline-nvim")
		end,
	})
    -- Show git sign: inserted, modified, deleted vs..
	--   also git blamer
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.git-signs-nvim")
		end,
	})
    -- Insert or delete brackets, parens, quotes in pair.
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs-nvim")
		end,
	})
    -- Icons pack
	use({ "kyazdani42/nvim-web-devicons" })
    -- Buffer closer
	use({
		"Asheq/close-buffers.vim",
		config = function()
			require("plugins.close-buffers")
		end,
	})
    -- Popup terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("plugins.toggleterm-nvim")
		end,
	})

    -- Initialize Packer
    if PACKER_BOOTSTRAP then
		packer.sync()
	end

end)
