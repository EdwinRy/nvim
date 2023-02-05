local mocha = require("catppuccin.palettes").get_palette "mocha"


require("bufferline").setup {
  options = {
    numbers = "ordinal",
    indicator = {
      -- style = "underline"
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
}
