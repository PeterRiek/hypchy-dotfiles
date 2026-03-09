-- nvim-treesitter gives Neovim the ability to understand the structure code not just the text.
-- This enables better highlighting, navigation, selection, folding, and plugin integrations.
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.config").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
			sync_install = true,
			auto_install = true,
			ensure_installed = {
				"c",
				"python",
				"lua",
			},
			ignore_install = {},
			modules = {},
			highligt = {
				enables = true
			}
		})

	end,
}
