local nnoremap = require("mohammad.keymap").nnoremap
local inoremap = require("mohammad.keymap").inoremap

inoremap("jk", "<Esc>")
inoremap("kj", "<Esc>")
inoremap("<C-p>", "<cmd>Telescope find_files<CR>")

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<C-p>", "<cmd>Telescope find_files<CR>")

-- harpoon
nnoremap("<leader>ha", function() require("harpoon.mark").add_file() end)
nnoremap("<leader>ht", function() require("harpoon.ui").toggle_quick_menu() end)
nnoremap("<leader>j", function() require("harpoon.ui").nav_file(1) end)
nnoremap("<leader>k", function() require("harpoon.ui").nav_file(2) end)
nnoremap("<leader>l", function() require("harpoon.ui").nav_file(3) end)

-- folding remaps
nnoremap("z{", "zfa{")
nnoremap("z(", "zfa(")
nnoremap("z[", "zfa[")

-- split navigation
nnoremap("<C-h>", "<C-w><C-h>")
nnoremap("<C-j>", "<C-w><C-j>")
nnoremap("<C-k>", "<C-w><C-k>")
nnoremap("<C-l>", "<C-w><C-l>")
