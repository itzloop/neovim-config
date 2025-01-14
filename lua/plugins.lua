require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- linters
    use 'mfussenegger/nvim-lint'

    -- ================== Auto Save ==================
    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end,
    })

    -- ================== Themes ==================
    use 'marko-cerovac/material.nvim'

    -- ================== DAP Plugins ==================
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "folke/neodev.nvim", "nvim-neotest/nvim-nio" } }
    use { "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap", "nvim-treesitter" } }
    use { "leoluz/nvim-dap-go", requires = "rcarriga/nvim-dap-ui" }

    use 'wakatime/vim-wakatime'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }


    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }


    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
    }
    }

    -- install some plugins for comenting
    use 'terrortylor/nvim-comment'

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    -- tabline up top
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }

    -- terminal management
    use { "akinsho/toggleterm.nvim" }

    use { "kyazdani42/nvim-web-devicons" }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        tag = 'release' -- To use the latest release
    }

    -- color highlights
    use { 'norcalli/nvim-colorizer.lua' }

    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })

    use { 'tpope/vim-fugitive' }

    use { 'nvim-lua/lsp-status.nvim' }
end

)

-- configure plugins
require("plugins.init")
