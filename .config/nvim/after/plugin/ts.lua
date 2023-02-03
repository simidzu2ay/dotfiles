local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end


configs.setup {
    ensure_installed = { "help", "c", "lua", "rust", "typescript", "javascript", "python" },
    auto_install = true,

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true
    }
}
