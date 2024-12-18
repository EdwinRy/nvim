vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.wrap = true
vim.cmd("set wrap")
vim.o.showbreak = "↪"
vim.o.breakindent = true
vim.o.linebreak = true

vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
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

vim.o.mouse = "a"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = "menuone,noselect"
-- vim.o.completeopt = "fuzzy"

-- editing mode already shown in status line
vim.o.showmode = false

-- use system clipboard
-- vim.o.clipboard = 'unnamedplus'

-- highlight on yank
-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

function _G.CustomFoldText()
    return vim.fn.getline(vim.v.foldstart)
        .. " ... "
        .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
end

vim.o.foldmethod = "expr"
vim.o.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldtext = "nvim_treesitter#foldtext()"
vim.opt.foldtext = "v:lua.CustomFoldText()"
vim.cmd("set nofoldenable")
