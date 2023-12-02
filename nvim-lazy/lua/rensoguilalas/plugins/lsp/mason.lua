return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"clangd",
				"cssls",
				"hls",
				"html",
				"jdtls",
				"jsonls",
				"kotlin_language_server",
				"lua_ls",
				"marksman",
				"pyright",
				"sqlls",
				"tsserver",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- formatters
				"black", -- python formatter
				"clang-format", -- c, c#, c++, json, java, javasctip formatter
				"fourmolu", -- haskell formatter
				"google-java-format", -- java formatter
				"isort", -- python formatter
				"ktlint", -- kotlin formatter
				"prettier", -- prettier formatter
				"sql-formatter", -- sql formatter
				"stylua", -- lua formatter

				-- linters
				"alex", -- markdown linter
				"selene", -- lua, luau linter
				"checkstyle", -- java linter
				"cpplint", -- c, c++ linter
				"eslint_d", -- typescript, javascript linter
				"jsonlint", -- json linter
				"ktlint", -- kotlin linter
				"markuplint", -- html linter
				"pylint", -- python linter
				"stylelint", -- css, sass, scss, less linter
			},
		})
	end,
}
