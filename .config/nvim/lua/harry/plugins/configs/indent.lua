vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")

require("ibl").setup({
	indent = { char = " ", tab_char = "⋅" },
	whitespace = {
		remove_blankline_trail = false,
	},
	scope = { enabled = false },
})
