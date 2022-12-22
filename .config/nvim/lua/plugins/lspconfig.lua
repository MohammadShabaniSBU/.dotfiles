local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'gopls',
  'eslint',
  'sumneko_lua',
  'dockerls',
  'html',
  'tailwindcss',
  'clangd',
  'phpactor',
})

lsp.setup()
