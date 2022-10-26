vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- install LSPs
    use { "williamboman/mason.nvim" }

    -- autocompletion
    use("L3MON4D3/LuaSnip")

    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use('saadparwaiz1/cmp_luasnip')

    use("mattn/vim-goimports")

    -- comments
    use('numToStr/Comment.nvim')


    -- fzf telescope
    use('nvim-telescope/telescope.nvim')
    -- plenary a telescope dependency
    use('nvim-lua/plenary.nvim')
    -- file browser; telescope extention
    use("nvim-telescope/telescope-file-browser.nvim")

    -- harpoon: to navigate between some files blazingly fast
    use('ThePrimeagen/harpoon')

    -- indent blankline: to clear blank
    use('lukas-reineke/indent-blankline.nvim')

    -- tree-sitter
    use('nvim-treesitter/nvim-treesitter')

    -- color schemes
    use "EdenEast/nightfox.nvim"

    -- status line in lua
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- make transparent background
    use('xiyaowong/nvim-transparent')

    -- floating terminal
    use("numToStr/FTerm.nvim")

    -- whichkey
    use("folke/which-key.nvim")

    -- noice plugin for better cmd and notification
    use({
        'folke/noice.nvim',
        event = "VimEnter",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            "hrsh7th/nvim-cmp",
        },
        config = function() require('noice').setup() end
    })
end)
