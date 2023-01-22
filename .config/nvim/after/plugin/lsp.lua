local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
    return
end
local is_ok, lspkind = pcall(require, 'lspkind')
if not is_ok then
    return
end

vim.opt.signcolumn = 'yes'
lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
    'tailwindcss',
    'prismals'
})

lsp.configure('jsonls', {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true }
        }
    }
})

local function has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local lsp_null = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html",
    "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "astro", "svelte" }

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            if has_value(lsp_null, client.filetype) then
                client.name = 'null-ls'
            end
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            -- return client.name == "null-ls"
            return client
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

lsp.on_attach(on_attach)



local cmp_kinds = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = "  ",
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}


lsp.setup_nvim_cmp({
    formatting = {
        fields = { "abbr", "kind" },
        format = function(_, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
            return vim_item
        end,
    },
})

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
