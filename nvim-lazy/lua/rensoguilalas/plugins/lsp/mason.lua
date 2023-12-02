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
        "ast_grep", -- c, c++, rust, go, java, python, c#, javascript, jsx, typescript, html, css, kotlin, dart, lua
        "clangd", -- c, c++
        "cssls", -- css, scss, less
        "hls", -- haskell
        "html", -- html
        "jdtls", -- java
        "kotlin_language_server", -- kotlin
        "lua_ls", -- lua
        "marksman", -- markdown
        "pyright", -- python
        "pylsp", -- python
        "sqlls", -- sql
        "tailwindcss", -- css
        "tsserver", -- typescript, javascript
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
      },
    })
  end,
}
