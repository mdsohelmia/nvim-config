require("hover").setup({
	init = function()
		require("hover.providers.lsp")
	end,
	preview_opts = {
		border = nil
	},
	-- Whether the contents of a currently open hover window should be moved
	-- to a :h preview-window when pressing the hover keymap.
	preview_window = false,
	title = true
})
