-- Leader Key: SPACE
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local ok, wk = pcall(require, "which-key")

if not ok then
	print("not ok")
	return
end

-- MULTIPLE MODES MAPPINGS
wk.add({
    mode = {"n","v","o" },
	{ "H", "^", desc = "[MOTION] Move to first character of line" },
	{ "L", "$", desc = "[MOTION] Move to last character of line" },
})

-- NORMAL mode mappings --
wk.add({
	mode = { "n" },
	-- Edition
	{ "c", '"_c', desc = "Do not copy when changing" },
	{ "C", '"_C', desc = "Do not copy when changing" },
	{ "cc", '"_cc', desc = "Do not copy when changing" },

	-- Find
	{ "<leader>f", group = "Find" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc="[TELESCOPE] Find File" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc="[TELESCOPE] Find File by live grep (search content)" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc="[TELESCOPE] Find buffers" },
	
	-- Splits
	{ "<leader>s", group = "Splits" },
    { "<leader>sh", "<cmd>split<cr>", desc = "[SPLIT] Horizontal split"},
    { "<leader>sv", "<cmd>vsplit<cr>", desc = "[SPLIT] Vertical split"},
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize current split"},
    { "<leader>sx", "<cmd>close<cr>", desc = "[SPLIT] Close current split"},

	-- Views
	{ "<leader>v", group = "Views" },
	{ "<leader>vf", "<cmd>Neotree toggle<cr>", desc = "[NEOTREE] Toggle file tree view" },

	-- Buffers
	{ "<leader>b", group = "Buffers" },
	{ "<leader>bn", "<cmd>bn<cr>", desc = "[BUFFER] Go next buffer" },
	{ "<leader>bp", "<cmd>bp<cr>", desc = "[BUFFER] Go previous buffer" },
	{ "<leader>bt", "<cmd>ene<cr>", desc = "[BUFFER] Open a new empty buffer" },
	{ "<leader>bx", "<cmd>bdelete!<cr>", desc = "[BUFFER] Close current buffer" },
	{ "<leader>bX", "<cmd>%bd!|e#|bd#<cr>", desc = "[BUFFER] Close all other buffers" },

    -- Errors and diagnostics
	{ "<leader>e", group = "[Errors and diagnostics]" },
    { "<leader>ee", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "[DIAG] Show error in line"},
	{ "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "[DIAG] Go to next error" },
	{ "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "[DIAG] Go to previous error" },


})

-- INSERT mode mappings --
wk.add({
	mode = { "i" },
	{ "jk", "<ESC>", desc = "Normal mode switch" },
	{ "<a-b>", "<C-o>b", desc = "Move to previous word" },
	{ "<a-c>", '<C-o>"_ciw', desc = "Change word" },
	{ "<a-d>", '<C-o>"_diw', desc = "Delete word" },
	{ "<a-e>", "<ESC>ea", desc = "Move to end of word" },
	{ "<a-j>", "<ESC>:m .+1<cr>==gi", desc = "[MOVE] Move block down" },
	{ "<a-k>", "<ESC>:m .-2<cr>==gi", desc = "[MOVE] Move block up" },
	{ "<a-s>", "<Del>", desc = "Handy DEL on insert mode" },
	{ "<a-w>", "<C-o>w", desc = "Move to next word" },
})

-- VISUAL mode mappings --
wk.add({
	mode = { "v" },
	-- Edit
	{ "C", '"_C', desc = "Do not copy when changing" },
	{ "c", '"_c', desc = "Do not copy when changing" },
	{ "cc", '"_cc', desc = "Do not copy when changing" },
	{ "p", '"_dP', desc = "Paste without replacing what is was in clipboard" },
	{ "<a-j>", ":m '>+1<cr>gv=gv", desc = "[MOVE] Move block down" },
	{ "<a-k>", ":m '<-2<cr>gv=gv", desc = "[MOVE] Move block up" },
})

-- TERMINAL mode mappings --
wk.add({
    mode = { "t" },
	{ "jk", "<ESC>", desc = "Normal mode switch" },
    { "<c-h>", "<cmd>wincmd h<cr>,", desc = "[TERMINAL] Move left" },
    { "<c-j>", "<cmd>wincmd j<cr>,", desc = "[TERMINAL] Move down" },
    { "<c-k>", "<cmd>wincmd k<cr>,", desc = "[TERMINAL] Move up" },
    { "<c-l>", "<cmd>wincmd l<cr>,", desc = "[TERMINAL] Move right" },
})

wk.setup({})

