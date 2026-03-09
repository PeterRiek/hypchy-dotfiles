local options = {
	shiftwidth = 4,
	tabstop = 4,

	clipboard = "unnamed,unnamedplus", -- Use system clipboard

	signcolumn = "yes", -- 
	ignorecase = true, -- Case insensitive search UNLESS /C or capital in search

	undodir = os.getenv("HOME") .. "/.vim/undidir", -- store undos in ~/.vim/undidir/
	undofile = true, -- save undo history

	number = true, -- Make line numbers default
	scrolloff = 3, -- keep 3 lines at bottom on scrolling

	foldenable = false,
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevel = 99,
	foldlevelstart = 99,
	foldmethod = "expr",

}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- UI theme
require("theme").set_active_theme("gruvbox")
