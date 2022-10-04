local nnoremap = require("mohammad.keymap").nnoremap
local inoremap = require("mohammad.keymap").inoremap
local tnoremap = require("mohammad.keymap").tnoremap

inoremap("jk", "<Esc>", { desc = "exit to normal mode" })
inoremap("kj", "<Esc>", { desc = "exit to normal mode" })

-- telescope keybindings
inoremap("<C-p>", "<cmd>Telescope find_files<CR>", { desc = "telescope fuzzy finder" })
nnoremap("<C-p>", "<cmd>Telescope find_files<CR>", { desc = "telescope fuzzy finder" })
nnoremap("<leader>pv", "<cmd>Telescope file_browser<CR><Esc>", { desc = "toggle telescope file browser" })
nnoremap("<leader>tc", "<cmd>Telescope colorscheme<CR><Esc>", { desc = "toggle telescope colorscheme picker" })
nnoremap("<leader>ts", "<cmd>Telescope live_grep<CR><Esc>",
    { desc = "toggle telescope live grep (search string in project)" })

-- folding remaps
nnoremap("z{", "zfa{", { desc = "fold {} block" })
nnoremap("z(", "zfa(", { desc = "fold () block" })
nnoremap("z[", "zfa[", { desc = "fold [] block" })

-- split navigation
nnoremap("<C-h>", "<C-w><C-h>", { desc = "go to the left screen" })
nnoremap("<C-j>", "<C-w><C-j>", { desc = "go to the down screen" })
nnoremap("<C-k>", "<C-w><C-k>", { desc = "go to the up screen" })
nnoremap("<C-l>", "<C-w><C-l>", { desc = "go to the right screen" })

-- floating terminal
nnoremap("<leader><CR>", "<cmd>lua require('FTerm').toggle()<CR>", { desc = "toggle floating terminal" })
tnoremap("<leader><CR>", "<cmd>lua require('FTerm').toggle()<CR>", { desc = "toggle floating terminal" })

-- gitui interface
nnoremap("<leader>gg", function() require("FTerm"):new({cmd= "gitui"}):toggle() end)


-- harpoon keybindings
nnoremap("<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "add file to harpoon list" })
nnoremap("<leader>ht", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "toggle harpoon menu" })
nnoremap("<leader>j", function() require("harpoon.ui").nav_file(1) end, { desc = "go to the first file of harpoon" })
nnoremap("<leader>k", function() require("harpoon.ui").nav_file(2) end, { desc = "go to the second file of harpoon" })
nnoremap("<leader>l", function() require("harpoon.ui").nav_file(3) end, { desc = "go to the third file of harpoon" })

-- lsp keybindings
nnoremap('<leader>dl', vim.diagnostic.open_float, { desc = "show diagnostic of current line" })
nnoremap('<leader>dw', vim.diagnostic.setloclist, { desc = "open diagnostic widnow of current buffer" })

nnoremap('<leader>gd', vim.lsp.buf.definition, { desc = "go to definition" })
nnoremap('<leader>gD', vim.lsp.buf.declaration, { desc = "go to declaration" })
nnoremap('<leader>gt', vim.lsp.buf.type_definition, { desc = " go to type definition" })
nnoremap('<leader>gi', vim.lsp.buf.implementation, { desc = "go to implementation" })

nnoremap('<leader>k', vim.lsp.buf.hover, { desc = "show type definition (dialog)" })
nnoremap('<leader>K', vim.lsp.buf.signature_help, { desc = "show signature help" })

nnoremap('<leader>rn', vim.lsp.buf.rename, { desc = "rename the symbol name of the symbol under cursor" })
nnoremap('<leader>la', vim.lsp.buf.code_action, { desc = "do code action for the line under cursor" })
nnoremap('<leader>lr', vim.lsp.buf.references, { desc = "open references window for symbol under cursor" })

nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
nnoremap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "list workspace folders" })

nnoremap('<leader>f', vim.lsp.buf.formatting, { desc = "format the buffer" })
