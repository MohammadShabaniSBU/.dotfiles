local lsp = require('lsp-zero')
lsp.preset({
    name = 'recommended',
    manage_nvim_cmp = true,
})

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'gopls',
  'eslint',
  'dockerls',
  'html',
  'tailwindcss',
  'clangd',
  'phpactor',
  'pylsp',
  'volar',
})

lsp.setup_nvim_cmp({
})

lsp.setup()

