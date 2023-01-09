local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local formater = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics;

null_ls.setup({
    sources = {
        formater.prettier.with({
            extra_filetypes = { "astro", "svelte" },
            extra_args = { "--plugin-search-dir=." }
        }),
        diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "postgres" }
        }),
        formater.pg_format,
    },
})
