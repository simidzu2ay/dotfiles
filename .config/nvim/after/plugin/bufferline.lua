local status_ok, bufferline = pcall(require, 'bufferline')

if not status_ok then
    return
end

vim.opt.termguicolors = true
bufferline.setup {
    options = {
        diagnostics = 'nvim_lsp',
        color_icons = true,
        show_buffer_icons = true,

        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
    }
}

require 'nvim-web-devicons'.setup {
    color_icons = true;
    default = true;
}

vim.keymap.set('n', '<Tab>', vim.cmd.BufferLineCycleNext)
vim.keymap.set('n', '<S-Tab>', vim.cmd.BufferLineCyclePrev)
