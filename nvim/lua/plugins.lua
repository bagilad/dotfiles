-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'

    use {
        "simrat39/rust-tools.nvim",
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'mfussenegger/nvim-dap'
        }
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    } 

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
            -- For vsnip users
            'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip',
            -- For luasnip users
            -- 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
            -- For ultisnips users
            -- 'SirVer/ultisnips', 'quangnguyen30192/cmp-nvim-ultisnips',
            -- For snippy users
            -- 'dcampos/nvim-snippy', 'dcampos/cmp-snippy'
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        -- tag = 'release' -- To use the latest release
    }

    -- Start: for Clojure
    use 'Olical/conjure'
    use 'guns/vim-sexp'
    use 'tpope/vim-sexp-mappings-for-regular-people'
    -- End: for Clojure

    use 'morhetz/gruvbox'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'b3nj5m1n/kommentary'
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'mhinz/vim-startify'

end)
