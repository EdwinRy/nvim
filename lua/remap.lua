-- GENERAL
vim.g.mapleader = " "

-- WINDOW CONTROLS
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move the cursor to the window on the left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move the cursor to the window below" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move the cursor to the window above" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move the cursor to the window on the right" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all windows apart from current" })

vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Move the cursor to the window on the left" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Move the cursor to the window below" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Move the cursor to the window above" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Move the cursor to the window on the right" })

vim.keymap.set("n", "<M-Left>", "<C-w>h", { desc = "Move the cursor to the window on the left" })
vim.keymap.set("n", "<M-Down>", "<C-w>j", { desc = "Move the cursor to the window below" })
vim.keymap.set("n", "<M-Up>", "<C-w>k", { desc = "Move the cursor to the window above" })
vim.keymap.set("n", "<M-Right>", "<C-w>l", { desc = "Move the cursor to the window on the right" })


local resizeFactor = 15
local resizeFactorBig = 30

-- window resizing
vim.keymap.set("n", "<M-L>", "<C-w>" .. resizeFactor .. ">", { desc = "Increase window width" })
vim.keymap.set("n", "<M-H>", "<C-w>" .. resizeFactor .. "<", { desc = "Decrease window width" })
vim.keymap.set("n", "<M-J>", "<C-w>" .. resizeFactor .. "+", { desc = "Increase window height" })
vim.keymap.set("n", "<M-K>", "<C-w>" .. resizeFactor .. "-", { desc = "Decrease window height" })

vim.keymap.set("n", "<M-C-L>", "<C-w>" .. resizeFactorBig .. ">", { desc = "Big increase window width" })
vim.keymap.set("n", "<M-C-H>", "<C-w>" .. resizeFactorBig .. "<", { desc = "Big decrease window width" })
vim.keymap.set("n", "<M-C-J>", "<C-w>" .. resizeFactorBig .. "+", { desc = "Big increase window height" })
vim.keymap.set("n", "<M-C-K>", "<C-w>" .. resizeFactorBig .. "-", { desc = "Big decrease window height" })

vim.keymap.set("n", "<M-+>", "<C-w>=", { desc = "Equalize window sizes" })

vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Move focused window to far left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Move focused window to the bottom" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "Move focused window to the top" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "Move focused window to the far right" })

vim.keymap.set("n", "<leader>wr", "<C-w>r", { desc = "Rotate windows" })
vim.keymap.set("n", "<leader>wR", "<C-w>R", { desc = "Rotate windows the other way" })

vim.keymap.set("n", "<C-Right>", "<C-w>H")
vim.keymap.set("n", "<C-Down>", "<C-w>J")
vim.keymap.set("n", "<C-Up>", "<C-w>K")
vim.keymap.set("n", "<C-Left>", "<C-w>L")

vim.keymap.set("n", "<leader>wv", "<C-w>v<C-w>l", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>ws", "<C-w>s<C-w>j", { desc = "Split window horizontally" })


-- BUFFERS
vim.keymap.set("n", "<leader>x", ":bp<bar>vs<bar>bn<bar>bd<CR>", { desc = "Delete current buffer", silent = true })
vim.keymap.set("n", "<leader>ba", ":bufdo bd<CR>", { desc = "Delete all buffers", silent = true })
vim.keymap.set("n", "<leader>z", ":bd<CR>", { desc = "Close buffer and pane", silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer and pane", silent = true })

if not Bufferline_loaded then
  vim.keymap.set("n", "<leader>]", ":bn<CR>", { desc = "Open next buffer", silent = true })
  vim.keymap.set("n", "<leader>[", ":bp<CR>", { desc = "Open previous buffer", silent = true })

  vim.keymap.set("n", "<M-]>", ":bn<CR>", { desc = "Open next buffer", silent = true })
  vim.keymap.set("n", "<M-[>", ":bp<CR>", { desc = "Open previous buffer", silent = true })
end


-- TABS
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab", silent = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("n", "<leader>t[", ":tabprev<CR>", { desc = "Previous tab", silent = true })
vim.keymap.set("n", "<leader>t]", ":tabnext<CR>", { desc = "Next tab", silent = true })

vim.keymap.set("n", "<C-M-[>", ":tabprev<CR>", { desc = "Previous tab", silent = true })
vim.keymap.set("n", "<C-M-]>", ":tabnext<CR>", { desc = "Next tab", silent = true })



-- MOVE HIGHLIGHT
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text up" })


-- CONFIG

vim.keymap.set("n", "<leader>cr", ":set rnu!<CR>", { desc = "Toggle relative numbers" })
vim.keymap.set("n", "<leader>ct", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end, { desc = "Toggle theme" })
vim.keymap.set("n", "<leader>cs", ":set sw=", { desc = "Set spaces to..." })





-- EDITING

vim.keymap.set("n", "J", "mzJ`z", { desc = "Move line below to end of this line" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center previous search result" })

vim.keymap.set("x", "<leader>sr", ":s/\\(\\s*\\)\\(.*\\)/\\1\\2<LEFT><LEFT>")
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Cut to clipboard" })



-- extra user commands

vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Waq', 'waq', {})
vim.api.nvim_create_user_command('Wqa', 'wqa', {})




-- Other
vim.keymap.set("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable", silent = true })
vim.api.nvim_set_keymap("i", "<C-/>", "copilot#Accept(\"<CR>\")", { expr = true, silent = true })
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename symbol" })

vim.keymap.set("n", "Q", "<nop>")





-- legacy

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- vim.keymap.set("n", "<leader>cr", ":so $MYVIMRC<CR>")
-- vim.keymap.set("n", "<leader>ce", ":e $MYVIMRC<CR>")
-- vim.keymap.set("n", "<leader>cp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/plugins.lua<CR>");
