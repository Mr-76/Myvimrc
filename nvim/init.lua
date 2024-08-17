require("config.packer")
require("config.lsp")
require("plugin.mason")
require("plugin.html")
require("plugin.css")
require("plugin.nvim-cmp")

require("luasnip.loaders.from_vscode").lazy_load()
--require'luasnip'.filetype_extend("html", {"html"})
--require'luasnip'.filetype_extend("css", {"css"})
--require("mason").setup({
--    ui = {
--        icons = {
--            package_installed = "✓",
--            package_pending = "➜",
--            package_uninstalled = "✗"
--        }
--    }
--})

require("luasnip.loaders.from_vscode").lazy_load()
vim.cmd([[source ~/.vimrc]])
--a
