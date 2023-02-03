local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use {
        'terrortylor/nvim-comment',
        config = function() require("plugins.nvim_comment") end
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require("plugins.nvim_tree")
        end
    }

    use 'mustache/vim-mustache-handlebars'
    use 'kdheepak/lazygit.nvim'

    use {
        'feline-nvim/feline.nvim',
        config = function() require('plugins.feline') end
    }

    use {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end,
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use "lukas-reineke/indent-blankline.nvim"

    use {'luochen1990/rainbow', config = function() vim.g.rainbow_active = 1 end}

    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons',
        after = "catppuccin",
        config = function()
            -- require("bufferline").setup {
            --     highlights = require("catppuccin.groups.integrations.bufferline").get()
            -- }
            require("plugins.bufferline")
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'justinmk/vim-sneak'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require("plugins.telescope")
        end
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("plugins.theme")
        end
    })

    use {
        'VonHeikemen/lsp-zero.nvim',
        config = function()
            require("plugins.lsp")
        end,
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

    use {
        'f3fora/cmp-spell',
        config = function() require("plugins.spellcheck") end,
        requires = {{'hrsh7th/nvim-cmp'}}
    }


    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("plugins.theme")
        end
    }


    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("plugins.which_key")
        end
    }


    use 'eandrju/cellular-automaton.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

end)
