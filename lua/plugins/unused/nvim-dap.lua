-- return {
--     "rcarriga/nvim-dap-ui",
--     dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
--     config = function()
--         require("neodev").setup({
--             library = { plugins = { "nvim-dap-ui" }, types = true },
--         })
--     end,
-- }

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "mxsdev/nvim-dap-vscode-js",
        "microsoft/vscode-js-debug",
        -- "stevearc/overseer.nvim",
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        require("dapui").setup()
        require("dap-go").setup()

        require("overseer").setup({
            dap = true,
        })

        -- require("mason").setup()
        -- require("mason-nvim-dap").setup({
        --     automatic_installation = true
        -- })

        require("dap-vscode-js").setup({
            -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
            -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            adapters = {
                "pwa-node",
                "pwa-chrome",
                "pwa-msedge",
                "node-terminal",
                "pwa-extensionHost",
            }, -- which adapters to register in nvim-dap
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        })

        for _, language in ipairs({ "typescript", "javascript" }) do
            require("dap").configurations[language] = {
                {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                },
            }
        end

        -- require("nvim-dap-virtual-text").setup({
        --     -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
        --     display_callback = function(variable)
        --         local name = string.lower(variable.name)
        --         local value = string.lower(variable.value)
        --         if
        --             name:match("secret")
        --             or name:match("api")
        --             or value:match("secret")
        --             or value:match("api")
        --         then
        --             return "*****"
        --         end
        --
        --         if #variable.value > 15 then
        --             return " " .. string.sub(variable.value, 1, 15) .. "... "
        --         end
        --
        --         return " " .. variable.value
        --     end,
        -- })

        vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
        vim.keymap.set("n", "<space>dc", dap.run_to_cursor)

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<F1>", dap.continue)
        vim.keymap.set("n", "<F2>", dap.step_into)
        vim.keymap.set("n", "<F3>", dap.step_over)
        vim.keymap.set("n", "<F4>", dap.step_out)
        vim.keymap.set("n", "<F5>", dap.step_back)
        vim.keymap.set("n", "<F13>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
