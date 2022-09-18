local wk = require("which-key")

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    -- triggers = "auto", -- automatically setup triggers
    triggers = {"<leader>"}, -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
}

local split_navigation = {
    ["<C-h>"] = {"<C-w><C-h>", "go to the right screen"},
    ["<C-j>"] = {"<C-w><C-j>", "go to the down screen"},
    ["<C-k>"] = {"<C-w><C-k>", "go to the up screen"},
    ["<C-l>"] = {"<C-w><C-l>", "go to the left screen"},
}

wk.register {
    ["<leader>"] = {
        ["<CR>"] = {"<cmd>lua require('FTerm').toggle()<CR>", "toggle floating terminal"},
        g = {
            name = "Git",
            g = {function() require("FTerm"):new({cmd = "gitui"}):toggle() end, "Open gitui"},
        },
        h = {
            name = "Harpoon",
            a = {function() require("harpoon.mark").add_file() end, "add file to harpoon list"},
            t = {function() require("harpoon.ui").toggle_quick_menu() end, "toggle harpoon menu"},
            j = {function() require("harpoon.ui").nav_file(1) end, "go to the first harpoon file"},
            k = {function() require("harpoon.ui").nav_file(2) end, "go to the second harpoon file"},
            l = {function() require("harpoon.ui").nav_file(3) end, "go to the third harpoon file"},
        },
        t = {
            name = "Telescope",
            f = {"<cmd>Telescope find_files<CR>", "telescope fuzzy finder"},
            b = {"<cmd>Telescope find_browser<CR>", "telescope file browser"},
            s = {"<cmd>Telescope live_grep<CR>", "telescope live grep"},
            c = {"<cmd>Telescope colorscheme<CR>", "telescope colorscheme"},
        },
    }
}

wk.register {
    ["<leader>"] = split_navigation
}
