-- This enables all the language servers I want on my system
-- Change these to whatever languages you use
require'lspconfig'.rnix.setup{}
--require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.sqls.setup{}
require'lspconfig'.tsserver.setup{}


vim.o.completeopt = "menuone,noselect"

local cmp = require'cmp'

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

cmp.setup({
    window = {
        documentation = {
            border = 'rounded',
            scrollbar = '║',
        },
        completion = {
            border = 'rounded',
            scrollbar = '║',
        },
    },
    mapping = {
        --['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }), -- disable tab in order to enable copilot
        ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources(
        {{ name = 'nvim_lsp' }, { name = 'buffer' }, { name = 'path' },
    }),
    formatting = {
        format = function(entry, vim_item)
        -- Kind icons
	    with_text = false

        
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        -- Source
        vim_item.menu = ({
            buffer = " ",
            nvim_lsp = " ",
            path = " ",
        })[entry.source.name]
        return vim_item
        end
    },
})

