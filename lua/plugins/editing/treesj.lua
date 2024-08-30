return {
  'Wansmer/treesj',
  keys = { '<space>sm', '<space>sj', '<space>ss' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup({--[[ your config ]]})
  end,
}
