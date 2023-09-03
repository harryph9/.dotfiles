local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

local on_attach = function(client, bufnr)
	require("completion").on_attach(client)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	"clangd",
	"lua_ls",
	"marksman",
	"gopls",
	"bashls",
	"html",
	"cssls",
	"pyright",
	"tsserver",
	"tailwindcss",
	"emmet_ls",
	"jsonls",
	"vuels",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

local signs = { Error = " ", Warn = " ", Hint = "󰛨 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
