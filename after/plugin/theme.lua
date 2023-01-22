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

end

function rose_pine_opaque()



end

rose_pine()
