return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Lua-Language-Server
					-- issue wih lua_ls version >= 3.16.0
					-- see https://neuralinsights-tar.netlify.app/?page=en-git-zed-extensions-lua-1764823019456
					"lua_ls@3.15.0",
					-- C language server
					"clangd",
					-- Python language server
					"basedpyright",
				}
			})
		end
	}
}
