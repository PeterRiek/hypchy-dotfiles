-- nvim-cmp is a completion engine for Neovim that provides context-aware suggestions while you type.
-- It supports sources from LSP, snippets, buffers, paths, and more, allowing flexible autocompletion.
-- Highly extensible and configurable, it lets you customize key mappings, sorting, and formatting of completion items.
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-copilot",                    -- Provides GitHub Copilot suggestions in nvim-cmp
		"hrsh7th/cmp-nvim-lsp",                   -- Adds Language Server Protocol (LSP) completions
		"hrsh7th/cmp-nvim-lua",                   -- Provides Neovim Lua API completions (useful for Lua configs)
		"hrsh7th/cmp-buffer",                     -- Enables buffer-based completions from current file
		"hrsh7th/cmp-path",                       -- Adds filesystem path completions
		"hrsh7th/cmp-cmdline",                    -- Provides completion in Neovim's command line (: commands, / search)
		"hrsh7th/cmp-nvim-lsp-document-symbol",   -- Offers LSP document symbol completions (functions, classes, variables)
		"L3MON4D3/LuaSnip",                       -- Snippet engine for inserting reusable code snippets
		"saadparwaiz1/cmp_luasnip",               -- Integrates LuaSnip snippets into nvim-cmp completion menu
		"lukas-reineke/cmp-under-comparator",     -- Improves sorting of completion items starting with underscores (e.g., Python)	},
		"onsails/lspkind.nvim",					  -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		-- require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp"},
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- customize the window the suggestions appear in
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
				}),
			},
		})
	end,
}
