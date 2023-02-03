vim.keymap.set("n", "<leader>tb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>dbc", "<cmd>lua require'dap'.continue()<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>dbsi", "<cmd>lua require'dap'.step_into()<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>dbso", "<cmd>lua require'dap'.step_over()<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>dbo", "<cmd>lua require'dap'.repl.open()<cr>",
    { silent = true, noremap = true }
)
