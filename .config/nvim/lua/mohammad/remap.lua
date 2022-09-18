local nnoremap = require("mohammad.keymap").nnoremap
local inoremap = require("mohammad.keymap").inoremap
local tnoremap = require("mohammad.keymap").tnoremap

inoremap("jk", "<Esc>")
inoremap("kj", "<Esc>")
inoremap("<C-p>", "<cmd>Telescope find_files<CR>")

nnoremap("<leader>pv", "<cmd>Telescope file_browser<CR><Esc>")
nnoremap("<C-p>", "<cmd>Telescope find_files<CR>")

-- folding remaps
nnoremap("z{", "zfa{")
nnoremap("z(", "zfa(")
nnoremap("z[", "zfa[")

-- split navigation
nnoremap("<C-h>", "<C-w><C-h>")
nnoremap("<C-j>", "<C-w><C-j>")
nnoremap("<C-k>", "<C-w><C-k>")
nnoremap("<C-l>", "<C-w><C-l>")

-- floating terminal
tnoremap("<leader><CR>", "<cmd>lua require('FTerm').toggle()<CR>")
