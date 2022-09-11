local lsp = require 'lspconfig'
local coq = require 'coq'

require "lsp_signature".setup{
    handler_opts = {
        border = "none",
    },
    padding = " ",
    toggle_key = "<C-x>",
};

lsp.sumneko_lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            telemetry = {
                enable = false,
            },
        }
    }
}
lsp.pyright.setup{coq.lsp_ensure_capabilities()}
lsp.cmake.setup{coq.lsp_ensure_capabilities()}
lsp.clangd.setup{coq.lsp_ensure_capabilities{
    cmd = {
        "clangd",
        "--header-insertion=never",
    },
}}
lsp.tsserver.setup{coq.lsp_ensure_capabilities()}
lsp.angularls.setup{coq.lsp_ensure_capabilities()}
lsp.emmet_ls.setup{coq.lsp_ensure_capabilities()}
lsp.rls.setup{coq.lsp_ensure_capabilities()}

vim.diagnostic.config({virtual_text = false})

vim.opt.list = true
require("indent_blankline").setup{}
require("todo-comments").setup{
    signs = false,
    highlight = {
        keyword = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]]
    }
}

