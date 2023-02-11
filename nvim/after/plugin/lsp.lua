local lsp = require("lsp-zero")
local keymap = vim.keymap.set

lsp.preset("recommended")
lsp.skip_server_setup({'rust_analyzer'})

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'pyright',
}) 

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()

local rust_lsp = lsp.build_options('rust_analyzer', {})
require('rust-tools').setup({server = rust_lsp})

vim.diagnostic.config({
    virtual_text = true,
})
