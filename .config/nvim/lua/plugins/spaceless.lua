return {
	-- Strip trailing whitespace as you are editing
	{
		"lewis6991/spaceless.nvim",
		config = function()
			require("spaceless").setup()
		end,
	},
}
