vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- copilot
    use { "zbirenbaum/copilot.lua" }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- comments
    use('numToStr/Comment.nvim')


    -- fzf telescope
    use('nvim-telescope/telescope.nvim')
    -- plenary a telescope dependency
    use('nvim-lua/plenary.nvim')
    -- file browser; telescope extention
    use("nvim-telescope/telescope-file-browser.nvim")
    -- recent files
    use {"smartpde/telescope-recent-files"}

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

    -- floating terminal
    use("numToStr/FTerm.nvim")

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
