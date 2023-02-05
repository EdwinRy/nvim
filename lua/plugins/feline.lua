local ctp_feline = require('catppuccin.groups.integrations.feline')
local components = ctp_feline.get()

components.inactive[1][1] = {
    provider = "file_info"
}

require("feline").setup({
    components = components,

})

