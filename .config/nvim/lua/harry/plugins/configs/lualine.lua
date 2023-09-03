local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lsp_progress = {
	function()
		local buf_clients = vim.lsp.get_active_clients()
		local buf_client_names = {}

		local list_registered = function(fileType)
			local null_ls = require("null-ls.sources")
			local available_sources = null_ls.get_available(fileType)
			local registered = {}
			for _, source in ipairs(available_sources) do
				for method in pairs(source.methods) do
					registered[method] = registered[method] or {}
					table.insert(registered[method], source.name)
				end
			end
			return registered
		end

		if next(buf_clients) == nil then
			return "No Active LSP"
		end
		for _, client in pairs(buf_clients) do
			if client.name ~= "null-ls" then
				table.insert(buf_client_names, client.name)
			end
		end

		vim.list_extend(buf_client_names, {})

		local unique_client_names = vim.fn.uniq(buf_client_names)
		return vim.o.columns > 150 and "  " .. table.concat(unique_client_names, ", ")
			or #vim.lsp.get_active_clients() .. " LSP Active"
	end,
}

local diff = {
	function()
		---@diagnostic disable-next-line: undefined-field
		if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
			return ""
		end

		---@diagnostic disable-next-line: undefined-field
		local git_status = vim.b.gitsigns_status_dict

		local added = function()
			if git_status.added == 0 then
				return ""
			end
			return " " .. git_status.added
		end
		local changed = function()
			if git_status.changed == 0 then
				return ""
			end
			return "  " .. git_status.changed
		end
		local removed = function()
			if git_status.removed == 0 then
				return ""
			end
			return "  " .. git_status.removed
		end

		return vim.o.columns > 100 and added() .. changed() .. removed() or ""
	end,
}

lualine.setup({
	options = {
		icons_enabled = true,
		--		theme = "rose-pine",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {
			"neo-tree",
			"mason",
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", diff },
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_x = {
			"encoding",
			lsp_progress,
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive" },
})
