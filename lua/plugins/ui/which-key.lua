local function config()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require("which-key")
    wk.setup({
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        show_help = true, -- show help message on the command line when the popup is visible
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        disable = {
            buftypes = {},
            filetypes = { "TelescopePrompt" },
        },
        -- expand = 2,
        expand = function(node)
            return not node.desc -- expand all nodes without a description
        end,
    })

    local ks = {}
    for _, v in pairs(KeyGroup) do
        table.insert(ks, { "" .. v.prefix, group = v.desc })
    end

    wk.add(ks)
end

local x = {1, 2, 3, 4}

return {
    "folke/which-key.nvim",
    priority = 20,
    config = config,
    dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons", },
}
