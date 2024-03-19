-- GENERAL

vim.g.mapleader = " "


-- WINDOW CONTROLS
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move the cursor to the window on the left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move the cursor to the window below" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move the cursor to the window above" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move the cursor to the window on the right" })

vim.keymap.set("n", "˙", "<C-w>h")
vim.keymap.set("n", "∆", "<C-w>j")
vim.keymap.set("n", "˚", "<C-w>k")
vim.keymap.set("n", "¬", "<C-w>l")

vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Move focused window to far left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Move focused window to the bottom" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "Move focused window to the top" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "Move focused window to the far right" })

vim.keymap.set("n", "<C-Right>", "<C-w>H")
vim.keymap.set("n", "<C-Down>", "<C-w>J")
vim.keymap.set("n", "<C-Up>", "<C-w>K")
vim.keymap.set("n", "<C-Left>", "<C-w>L")

vim.keymap.set("n", "<leader>wv", "<C-w>v<C-w>l", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>ws", "<C-w>s<C-w>j", { desc = "Split window horizontally" })


-- BUFFERS
vim.keymap.set("n", "<leader>x", ":bp<bar>vs<bar>bn<bar>bd<CR>", { desc = "Delete buffer", silent = true })
vim.keymap.set("n", "<leader>z", ":bd<CR>", { desc = "Close buffer", silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer", silent = true })

if not Bufferline_loaded then
  vim.keymap.set("n", "<leader>]", ":bn<CR>", { desc = "Next buffer", silent = true })
  vim.keymap.set("n", "<leader>[", ":bp<CR>", { desc = "Previous buffer", silent = true })

  vim.keymap.set("n", "<M-]>", ":bn<CR>", { desc = "Next buffer", silent = true })
  vim.keymap.set("n", "<M-[>", ":bp<CR>", { desc = "Previous buffer", silent = true })
end

vim.keymap.set("n", "<leader>sw", ":set sw=")


-- MOVE HIGHLIGHT
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text up" })


-- NAVIGATION
-- vim.keymap.set("n", "<leader>t", "zt")

-- PLUGINS
vim.keymap.set("n", "<leader>gl", ":LazyGit<CR>", { desc = "Open lazygit" })

-- CONFIG

vim.keymap.set("n", "<leader>cr", ":so $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>ce", ":e $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>cp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/plugins.lua<CR>");

-- EDITING

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>sr", ":s/\\(\\s*\\)\\(.*\\)/\\1\\2<LEFT><LEFT>")

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
vim.api.nvim_set_keymap("i", "<C-/>", "copilot#Accept(\"<CR>\")", {expr=true, silent=true})


