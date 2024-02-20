return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc='Find Files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc='Find Grep'})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc='Find Buffers'})
    end
}