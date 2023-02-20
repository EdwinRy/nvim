-- GENERAL

vim.g.mapleader = " "



-- WINDOW CONTROLS
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

vim.keymap.set("n", "<leader>wH", "<C-w>H")
vim.keymap.set("n", "<leader>wJ", "<C-w>J")
vim.keymap.set("n", "<leader>wK", "<C-w>K")
vim.keymap.set("n", "<leader>wL", "<C-w>L")

vim.keymap.set("n", "<leader>wv", "<C-w>v<C-w>l")
vim.keymap.set("n", "<leader>ws", "<C-w>s<C-w>j")


-- BUFFERS
vim.keymap.set("n", "<leader>x", ":bp<bar>vs<bar>bn<bar>bd<CR>")
vim.keymap.set("n", "<leader>z", ":bd<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
vim.keymap.set("n", "<leader>]", ":bn<CR>")
vim.keymap.set("n", "<leader>[", ":bp<CR>")

vim.keymap.set("n", "<leader>sw", ":set sw=")


-- MOVE HIGHLIGHT
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- NAVIGATION
vim.keymap.set("n", "<leader>t", "zt")

-- PLUGINS 
vim.keymap.set("n", "<leader>gl", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>ast", ":TSPlayground<CR>")

-- CONFIG

vim.keymap.set("n", "<leader>cr", ":so $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>ce", ":e $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>cp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/plugins.lua<CR>");

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>");
