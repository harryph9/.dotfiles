local opts = {
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
	sort_case_insensitive = false,
	sources = { "filesystem", "buffers", "git_status" },
	source_selector = {
		winbar = true,
		content_layout = "center",
		sources = {
			{ source = "filesystem", display_name = " File" },
			{ source = "git_status", display_name = "󰊢 Git" },
		},
	},
	window = {
		width = 30,
		mappings = {
			["<space>"] = false,
			[">"] = "next_source",
			["o"] = "open",
		},
	},
	filesystem = {
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
	  filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = {
                ".git",
    },
    follow_current_file = {
            enabled = true,
    },
	},
},
	-- follow_current_file.enabled=true,
	default_component_configs = {
		indent = { padding = 0, indent_size = 1 },
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			default = "",
		},
		modified = { symbol = "" },
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "➜",
				untracked = "★",
				ignored = "◌",
				unstaged = "✗",
				staged = "✓",
				conflict = "",
			},
		},
	},
}

vim.g.neo_tree_remove_legacy_commands = true
require("neo-tree").setup(opts)
