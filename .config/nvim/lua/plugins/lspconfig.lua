-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- See `:help vim.lsp.*` for documentation on any of the below functions

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- rust config
lspconfig.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {}
    }
}

-- go config
lspconfig.gopls.setup {
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- javascript / typescript config
lspconfig.tsserver.setup {}

-- docker config
lspconfig.dockerls.setup {}

-- lua config
lspconfig.sumneko_lua.setup {}

-- html config
lspconfig.html.setup {}

-- tailwindcss config
lspconfig.tailwindcss.setup {}
