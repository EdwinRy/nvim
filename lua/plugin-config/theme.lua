function rose_pine()
    require('rose-pine').setup({
        --- @usage 'main' | 'moon'
        dark_variant = 'mocha',
        disable_background = true,
        disable_float_background = false,

        -- Change specific vim highlight groups
        highlight_groups = {
            ColorColumn = { bg = 'rose' }
        }
    })

    -- set colorscheme after options
    vim.cmd('colorscheme rose-pine')
    vim.api.nvim_set_hl(0, "NonText", { fg = "#103e94" })
    -- vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#103e94" })

    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#0a2861" })
end

function rose_pine_opaque()

end

function cattpuccin(transparent)
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {         -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = transparent,
        show_end_of_buffer = true, -- show the '~' characters after the end of buffers
        term_colors = true,
        dim_inactive = {
            enabled = true,
            -- the higher the less difference in the dimming
            percentage = 0.5,
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = { "italic" },
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = false,
            mini = false,
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
        highlight_overrides = {
            all = function(colors)
                return {
                    LineNr = { fg = colors.overlay1 },
                }
            end,
            -- all = function(colors)
            --     return {
            --         NvimTreeNormal = { fg = colors.none },
            --         CmpBorder = { fg = "#3e4145" },
            --     }
            -- end,
            -- latte = function(latte)
            --     return {
            --         Normal = { fg = latte.base },
            --     }
            -- end,
            -- frappe = function(frappe)
            --     return {
            --         ["@comment"] = { fg = frappe.surface2, style = { "italic" } },
            --     }
            -- end,
            macchiato = function(macchiato)
                return {
                    LineNr = { fg = macchiato.overlay1 },
                }
            end,
            mocha = function(mocha)
                return {
                    LineNr = { fg = mocha.overlay1 },
                }
            end,
        },
    })

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
    vim.api.nvim_set_hl(0, "NonText", { fg = "#103e94" })
end

-- rose_pine()
cattpuccin(false)
