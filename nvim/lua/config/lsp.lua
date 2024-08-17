local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.tsserver.setup({
  capabilities = lsp_capabilities,
})
lspconfig.lua_ls.setup({
  capabilities = lsp_capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<C-f>', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
--vim.api.nvim_create_autocmd('LspAttach', {
--  desc = 'LSP actions',
--  callback = function()
--    local bufmap = function(mode, lhs, rhs)
--      local opts = {buffer = true}
--      vim.keymap.set(mode, lhs, rhs, opts)
--    end
--
--    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
--    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
--    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
--    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
--    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
--    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
--    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
--    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
--    bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
--    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
--    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
--    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
--    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
--  end
--})
