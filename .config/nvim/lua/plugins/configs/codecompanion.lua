-- AI assistant coding
-- adapters will look in your environment for a *_API_KEY where * is the name of the adapter
return {
	'olimorris/codecompanion.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		{ 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } },
	},
	config = function()
		local status, secrets = pcall(require, 'secrets')
		local gemini_key = status and secrets.gemini_api_key or ''
		require('codecompanion').setup {
			display = {
				chat = {
					window = {
						layout = "vertical",
						position = "right"
					}
				}
			},
			adapters = {
				gemini = function ()
					return require("codecompanion.adapters").extend("gemini", {
						adapter = {
							name = 'gemini',
							model = 'gemini-2.5-flash'
						},
						env = {
							api_key = gemini_key,
						}
					})
				end
			},
			strategies = {
				chat = {
					adapter = {
						name = 'gemini',
						model = 'gemini-2.5-flash'
					},
				},
				inline = {
					adapter = {
						name = 'gemini',
						model = 'gemini-2.5-flash'
					},
					context = {
						buffer = true
					}
				},
			},
		}
	end,
}
