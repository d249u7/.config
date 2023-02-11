return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        }
    }

    use 'simrat39/rust-tools.nvim'
    use 'mfussenegger/nvim-dap'

    use "folke/which-key.nvim"
    use "mrjones2014/smart-splits.nvim"
    use "projekt0n/github-nvim-theme"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true, }
    }
end)
