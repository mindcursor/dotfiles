-- This plugin's only (current) purpose is to right-align the current line number in the gutter so
-- it is aligned to the rest of the relative line numbers. QOL amirite?
return {
	"luukvbaal/statuscol.nvim",
	config = function()
		require("statuscol").setup({
			relculright = true,
		})
	end,
}
