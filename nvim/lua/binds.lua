local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

local common_opts = {noremap = true, silent = true}

-- move to window
keymap("n", "<leader>h", ":wincmd h<CR>", common_opts)
keymap("n", "<leader>j", ":wincmd j<CR>", common_opts)
keymap("n", "<leader>k", ":wincmd k<CR>", common_opts)
keymap("n", "<leader>l", ":wincmd l<CR>", common_opts)

-- move window
keymap("n", "<leader><C-h>", ":wincmd H<CR>", common_opts)
keymap("n", "<leader><C-j>", ":wincmd J<CR>", common_opts)
keymap("n", "<leader><C-k>", ":wincmd K<CR>", common_opts)
keymap("n", "<leader><C-l>", ":wincmd L<CR>", common_opts)

-- resize window
keymap("n", "<leader><S-h>", ":vert res -5<CR>", common_opts)
keymap("n", "<leader><S-j>", ":res +5<CR>", common_opts)
keymap("n", "<leader><S-k>", ":res -5<CR>", common_opts)
keymap("n", "<leader><S-l>", ":vert res +5<CR>", common_opts)

-- tabs
keymap("n", "<leader>gc", ":tabc<CR>", common_opts)

-- gitgutter
keymap("n", "]h", "<Plug>(GitGutterNextHunk)", {})
keymap("n", "[h", "<Plug>(GitGutterPrevHunk)", {})
keymap("n", "<leader>ghs", "<Plug>(GitGutterStageHunk)", {})
keymap("n", "<leader>ghu", "<Plug>(GitGutterUndoHunk)", {})
keymap("n", "<leader>ghp", "<Plug>(GitGutterPreviewHunk)", {})

-- lsp
keymap("n", "<leader>fD", "<cmd>lua vim.lsp.buf.declaration()<CR>", common_opts)
keymap("n", "<leader>fd", "<cmd>lua vim.lsp.buf.definition()<CR>", common_opts)
keymap("n", "<leader>fi", "<cmd>lua vim.lsp.buf.implementation()<CR>", common_opts)
keymap("n", "<leader>fr", "<cmd>lua vim.lsp.buf.references()<CR>", common_opts)
keymap("n", "<leader>fs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", common_opts)
keymap("n", "<leader>fh", "<cmd>lua vim.lsp.buf.hover()<CR>", common_opts)
keymap("n", "<leader>fa", "<cmd>lua vim.lsp.buf.code_action()<CR>", common_opts)
keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", common_opts)
keymap("v", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", common_opts)
keymap("n", "<leader>fe", "<cmd>lua vim.diagnostic.open_float()<CR>", common_opts)

keymap("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", common_opts)
keymap("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next()<CR>", common_opts)

-- clangd specific
keymap("n", "<leader>fc", "<cmd>ClangdSwitchSourceHeader<CR>", common_opts)

-- trees
keymap("n", "<leader>u", ":UndotreeShow<CR>", common_opts)
keymap("n", "<leader>e", ":NERDTreeMirror<CR>:NERDTreeFocus<CR>", common_opts)
