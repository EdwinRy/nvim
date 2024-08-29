return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR 'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
  },
  priority = 60,
  config = function()
    require "octo".setup(
      {
        suppress_missing_scope = {
          projects_v2 = true,
        },
        picker = "telescope", -- or "fzf-lua"
        picker_config = {
          use_emojis = true,  -- only used by "fzf-lua" picker for now
          mappings = {        -- mappings for the pickers
            open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },
            merge_pr = { lhs = "<C-r>", desc = "merge pull request" },
          },
        },
        gh_cmd = "gh",                    -- Command to use when calling Github CLI
        gh_env = {},                      -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
        timeout = 5000,                   -- timeout for requests between the remote server
        mappings_disable_default = false, -- disable default mappings if true, but will still adapt user mappings
        mappings = {
          issue = {
            close_issue = { lhs = "<leader>oic", desc = "close issue heres me" },
            reopen_issue = { lhs = "<leader>oio", desc = "reopen issue" },
            list_issues = { lhs = "<leader>oil", desc = "list open issues on same repo" },
            reload = { lhs = "<C-r>", desc = "reload issue" },
            open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            add_assignee = { lhs = "<leader>oaa", desc = "add assignee" },
            remove_assignee = { lhs = "<leader>oad", desc = "remove assignee" },
            create_label = { lhs = "<leader>olc", desc = "create label" },
            add_label = { lhs = "<leader>ola", desc = "add label" },
            remove_label = { lhs = "<leader>old", desc = "remove label" },
            goto_issue = { lhs = "<leader>ogi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>oca", desc = "add comment" },
            delete_comment = { lhs = "<leader>ocd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<leader>orp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>orh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>ore", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>or+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>or-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>orr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>orl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>orc", desc = "add/remove 😕 reaction" },
          },
          pull_request = {
            checkout_pr = { lhs = "<leader>opo", desc = "checkout PR" },
            merge_pr = { lhs = "<leader>opm", desc = "merge commit PR" },
            squash_and_merge_pr = { lhs = "<leader>opsm", desc = "squash and merge PR" },
            rebase_and_merge_pr = { lhs = "<leader>oprm", desc = "rebase and merge PR" },
            list_commits = { lhs = "<leader>opcc", desc = "list PR commits" },
            list_changed_files = { lhs = "<leader>opf", desc = "list PR changed files" },
            show_pr_diff = { lhs = "<leader>opd", desc = "show PR diff" },
            add_reviewer = { lhs = "<leader>ova", desc = "add reviewer" },
            remove_reviewer = { lhs = "<leader>ovd", desc = "remove reviewer request" },
            close_issue = { lhs = "<leader>oic", desc = "close PR" },
            reopen_issue = { lhs = "<leader>oio", desc = "reopen PR" },
            list_issues = { lhs = "<leader>oil", desc = "list open issues on same repo" },
            reload = { lhs = "<C-r>", desc = "reload PR" },
            open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            goto_file = { lhs = "gf", desc = "go to file" },
            add_assignee = { lhs = "<leader>oaa", desc = "add assignee" },
            remove_assignee = { lhs = "<leader>oad", desc = "remove assignee" },
            create_label = { lhs = "<leader>olc", desc = "create label" },
            add_label = { lhs = "<leader>ola", desc = "add label" },
            remove_label = { lhs = "<leader>old", desc = "remove label" },
            goto_issue = { lhs = "<leader>ogi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>oca", desc = "add comment" },
            delete_comment = { lhs = "<leader>ocd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<leader>orp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>orh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>ore", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>or+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>or-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>orr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>orl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>orc", desc = "add/remove 😕 reaction" },
            review_start = { lhs = "<leader>ovs", desc = "start a review for the current PR" },
            review_resume = { lhs = "<leader>ovr", desc = "resume a pending review for the current PR" },
          },
          review_thread = {
            goto_issue = { lhs = "<leader>ogi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>oca", desc = "add comment" },
            add_suggestion = { lhs = "<leader>osa", desc = "add suggestion" },
            delete_comment = { lhs = "<leader>ocd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            select_next_entry = { lhs = "]q", desc = "move to next changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
            select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
            select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            react_hooray = { lhs = "<leader>orp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>orh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>ore", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>or+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>or-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>orr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>orl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>orc", desc = "add/remove 😕 reaction" },
          },
          submit_win = {
            approve_review = { lhs = "<C-a>", desc = "approve review" },
            comment_review = { lhs = "<C-m>", desc = "comment review" },
            request_changes = { lhs = "<C-r>", desc = "request changes review" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
          },
          review_diff = {
            submit_review = { lhs = "<leader>ovs", desc = "submit review" },
            discard_review = { lhs = "<leader>ovd", desc = "discard review" },
            add_review_comment = { lhs = "<leader>oca", desc = "add a new review comment" },
            add_review_suggestion = { lhs = "<leader>osa", desc = "add a new review suggestion" },
            focus_files = { lhs = "<leader>oe", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<leader>ob", desc = "hide/show changed files panel" },
            next_thread = { lhs = "]t", desc = "move to next thread" },
            prev_thread = { lhs = "[t", desc = "move to previous thread" },
            select_next_entry = { lhs = "]q", desc = "move to next changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
            select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
            select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            toggle_viewed = { lhs = "<leader>ovv", desc = "toggle viewer viewed state" },
            goto_file = { lhs = "gf", desc = "go to file" },
          },
          file_panel = {
            submit_review = { lhs = "<leader>ovs", desc = "submit review" },
            discard_review = { lhs = "<leader>ovd", desc = "discard review" },
            next_entry = { lhs = "j", desc = "move to next changed file" },
            prev_entry = { lhs = "k", desc = "move to previous changed file" },
            select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
            refresh_files = { lhs = "R", desc = "refresh changed files panel" },
            focus_files = { lhs = "<leader>oe", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<leader>ob", desc = "hide/show changed files panel" },
            select_next_entry = { lhs = "]q", desc = "move to next changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
            select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
            select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            toggle_viewed = { lhs = "<leader>ovv", desc = "toggle viewer viewed state" },
          },
        }
      }
    )
    vim.treesitter.language.register('markdown', 'octo')

    local wkMappings = {}
    local octoMappings = require("octo.config").values.mappings
    local lhsTable = {}
    for _, group in pairs(octoMappings) do
      for _, mapping in pairs(group) do
        if string.sub(mapping.lhs, 1, #"<leader>") == "<leader>" and not lhsTable[mapping.lhs] then
          table.insert(wkMappings, {mapping.lhs, desc = mapping.desc})
          lhsTable[mapping.lhs] = true
        end

      end
    end
    require('which-key').add(wkMappings)

    vim.keymap.set("n", "<leader>opl", ":Octo pr list<CR>", { desc = "List pull requests", silent = true })
    vim.keymap.set("n", "<leader>opse", ":Octo pr search<CR>", { desc = "Search pull requests", silent = true })
    vim.keymap.set("n", "<leader>opcl", ":Octo pr close<CR>", { desc = "Close pull request", silent = true })
    vim.keymap.set("n", "<leader>oprl", ":Octo pr reload<CR>", { desc = "Reload PR", silent = true })
    vim.keymap.set("n", "<leader>ordi", ":Octo review close<CR>", { desc = "Discard review", silent = true })
  end
}
