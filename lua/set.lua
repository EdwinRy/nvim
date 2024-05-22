
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#0a2861" })

vim.opt.listchars:append({
    tab = "→ ",
    space = "·",
    nbsp = "␣",
    trail = "•",
    eol = "$",
    precedes = "«",
    extends = "»",
})
vim.opt.list = true

vim.o.mouse = 'a'

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = 'menuone,noselect'



-- highlight on yank
-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})



-- vim.g.do_filetype_lua = 1

-- vim.o.spellcapcheck = nil
-- vim.o.spelloptions = "camel"
-- vim.o.spelllang = 'en_gb'
-- vim.o.spell = true
-- vim.api.nvim_create_autocmd("BufEnter", { command = [[set spelloptions=camel]] })
-- vim.cmd("syn match ShortWords /\a\\{2,4}/ contains=@NoSpell")

