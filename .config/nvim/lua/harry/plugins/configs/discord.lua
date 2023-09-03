require("presence").setup({
	-- General options
	auto_update = true,
	neovim_image_text = "The One True Text Editor",
	main_image = "file",
	log_level = nil,
	debounce_timeout = 10,
	enable_line_number = false,
	buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
	show_time = true, -- Show the timer

	editing_text = "Just coding %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
	git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
	plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
	reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
	workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
})
