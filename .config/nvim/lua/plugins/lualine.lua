local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

lualine.setup({
	options = {
		icons_enabled = false,
	},
	sections = {
		lualine_b = {
			{
				"diff",
				source = diff_source,
				colored = true,
			},
		},
	},
	extensions = { "quickfix" },
})
