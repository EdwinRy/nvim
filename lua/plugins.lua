local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- File searching
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cond = (function() return not vim.g.vscode end),
        config = function()
            require("plugins.telescope")
        end
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        cond = (function() return not vim.g.vscode end),
        config = function()
            require("plugins.nvim_tree")
        end
    },

    -- Syntax parsing
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        init = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
                sync_install = false,
                auto_install = true,
            }
            ts_update()
            vim.cmd("TSToggle highlight")
        end
    },

    -- Keymap help
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("plugins.which_key")
        end,
        cond = (function() return not vim.g.vscode end)
    },

    -- Theme
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        cond = (function() return not vim.g.vscode end),
        config = function()
            require("plugins.theme")
        end
    },

    -- Git
    {
        "kdheepak/lazygit.nvim",
        cond = (function() return not vim.g.vscode end),
        -- optional for floating window border decoration
        -- dependencies = {
        --     "nvim-lua/plenary.nvim",
        -- },
    },

    -- Surround
    { "tpope/vim-surround" },

    -- TabStop
    -- { "tpope/vim-sleuth" },

    -- -- Blank lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup({
                scope = {
                    show_start = false,
                    show_end = false,
                }
            })
        end,
    },

    {
        "nmac427/guess-indent.nvim",
        cond = (function() return not vim.g.vscode end),
        config = function()
            require("guess-indent").setup {}
        end,
    },

    -- Diagnostics display
    {
        "folke/trouble.nvim",
        cond = (function() return not vim.g.vscode end),
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    -- Comment
    {
        'numToStr/Comment.nvim',
        cond = (function() return not vim.g.vscode end),
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        cond = (function() return not vim.g.vscode end),
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

    {
        "windwp/nvim-autopairs",
        cond = (function() return not vim.g.vscode end),
        config = function()
            require("nvim-autopairs").setup {}
        end
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        cond = (function() return not vim.g.vscode end),
        config = function()
            require("plugins.lsp")
        end,
        dependencies = {

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


            -- LSP status updates
            { 'j-hui/fidget.nvim',                tag = 'legacy', opts = {} },
            {
                'folke/neodev.nvim',
                config = function()
                    require("neodev").setup()
                end,
            },
        }
    },

    -- Context
    {
        "nvim-treesitter/nvim-treesitter-context",
        cond = (function() return not vim.g.vscode end),
    },

    -- Gitsigns
    {
        'lewis6991/gitsigns.nvim',
        cond = (function() return not vim.g.vscode end),
    },

    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        cond = (function() return not vim.g.vscode end),
        config = function()
            require("plugins.lualine")
        end,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },

    {
        'akinsho/bufferline.nvim',
        cond = (function() return not vim.g.vscode end),
        version = "v3.*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        after = "catppuccin",
        config = function()
            require("plugins.bufferline")
        end
    },

    {
        'luochen1990/rainbow',
        cond = (function() return not vim.g.vscode end),
        config = function()
            vim.g.rainbow_active = 1
        end
    },


    -- Terminal
    {
        'akinsho/toggleterm.nvim',
        cond = (function() return not vim.g.vscode end),
        version = "*",
        config = function()
            require("plugins.toggleterm")
        end
    },


    { "github/copilot.vim", cond = (function() return not vim.g.vscode end) },

    -- use {
    --     "kamykn/spelunker.vim",
    --     config = function()
    --         require("plugins.spell")
    --     end
    -- }

}


require("lazy").setup(plugins, opts)
