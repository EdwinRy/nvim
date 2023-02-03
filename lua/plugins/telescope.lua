require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<C-o>"] = function(prompt_bufnr) require("telescope.actions").select_default(prompt_bufnr) require("telescope.builtin").resume() end,
			}
		}
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>fl', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>fo', builtin.lsp_outgoing_calls, {})
vim.keymap.set('n', '<leader>fp', builtin.diagnostics, {})
