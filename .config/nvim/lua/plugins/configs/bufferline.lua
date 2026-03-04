return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = function()
							return vim.fn.getcwd()
						end,
						highlight = "Directory",
						text_align = "left",
					},
				},
			}
		})
	end

}
