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

-- clang config
lspconfig.clangd.setup {}

-- php config
lspconfig.phpactor.setup {}

-- HDL config
lspconfig.hdl_checker.setup {
    cmd = { "hdl_checker", "--lsp", };
    filetypes = { "vhdl", "verilog", "systemverilog" };
    root_dir = function(fname)
        -- will look for the .hdl_checker.config file in parent directory, a
        -- .git directory, or else use the current directory, in that order.
        return util.root_pattern('.hdl_checker.config')(fname) or util.find_git_ancestor(fname) or
            util.path.dirname(fname)
    end;
    settings = {};
}

