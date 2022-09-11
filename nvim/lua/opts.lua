local options = {
    termguicolors = true,
    hlsearch = false,

    -- swap
    swapfile = false,
    backup = false,

    -- undo
    undodir = os.getenv("HOME") .. "/.config/nvim/undodir/",
    undofile = true,
    updatetime = 750,

    -- sounds
    errorbells = false,
    
    -- indenting
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,
    smartindent = true,
    copyindent = true,

    -- gutter
    number = true,
    relativenumber = true,
    signcolumn = "yes",

    -- scrolling
    scrolloff = 8,
    mouse = "a",

    -- search
    incsearch = true,
    ignorecase = true,

    -- line length
    colorcolumn = "80",
    wrap = false,

    -- cmdline
    showmode = false,
    cmdheight = 1,
    laststatus = 2,

    -- wm rules
    title = true,
    titlestring = "vim: %-25.55F %a%r%m",

    -- folding
    foldmethod = "indent",
    foldlevel = 32,

    -- cursor
    cursorline = true,
    guicursor="a:block",

    -- completion
    omnifunc = "v:lua.vim.lsp.omnifunc",
    completeopt = "menuone,preview,noselect",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
