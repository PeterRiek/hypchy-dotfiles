return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		config = function ()
			local neotree = require("neo-tree")
			neotree.setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_diagnostics = true,
				enable_git_status = true,
                follow_current_file = { enabled = true },
                group_empty_dirs = false,
                use_libuv_file_watcher = false,

				-- Buffers source
				buffers = {
					follow_current_file = { enabled = true },
					group_empty_dirs = true,
					show_unloaded = true,
				},
			})
		end
	}
}
