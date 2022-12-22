local nnoremap = require("mohammad.keymap").nnoremap
local inoremap = require("mohammad.keymap").inoremap

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
    pickers = {
        find_files = {
        },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {},
                ["n"] = {},
            },
        },
    },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

-- remaps
inoremap("<C-p>", "<cmd>Telescope find_files<CR>", { desc = "telescope fuzzy finder" })
nnoremap("<C-p>", "<cmd>Telescope find_files<CR>", { desc = "telescope fuzzy finder" })
nnoremap("<C-m>", "<cmd>Telescope jumplist<CR>", { desc = "telescope jumplist" })
nnoremap("<leader>pv", "<cmd>Telescope file_browser<CR><Esc>", { desc = "toggle telescope file browser" })
nnoremap("<leader>tc", "<cmd>Telescope colorscheme<CR><Esc>", { desc = "toggle telescope colorscheme picker" })
nnoremap("<leader>ts", "<cmd>Telescope live_grep<CR><Esc>",
    { desc = "toggle telescope live grep (search string in project)" })
