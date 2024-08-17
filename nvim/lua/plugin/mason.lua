require('mason').setup()
require('mason-lspconfig').setup()


local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = lsp_capabilities,
})

-- HTML LSP setup
lspconfig.html.setup({
  capabilities = lsp_capabilities,
})

-- CSS LSP setup
lspconfig.cssls.setup({
  capabilities
  })
