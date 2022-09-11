local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugged")

-- lsp
Plug "neovim/nvim-lspconfig"

-- autocomplete
Plug("ms-jpq/coq_nvim", { branch = "coq" })
Plug("ms-jpq/coq.artifacts", { branch = "artifacts" })
Plug "ray-x/lsp_signature.nvim"

-- syntax & indents, brackets, comments
Plug "sheerun/vim-polyglot"
Plug "lukas-reineke/indent-blankline.nvim"
Plug "jiangmiao/auto-pairs"
Plug "tpope/vim-commentary"
Plug "folke/todo-comments.nvim"

-- undo, git, explorer
Plug "mbbill/undotree"
Plug "tpope/vim-fugitive"
Plug "tpope/vim-rhubarb"
Plug "airblade/vim-gitgutter"
Plug "preservim/nerdtree"
Plug "PhilRunninger/nerdtree-visual-selection"
Plug "ctrlpvim/ctrlp.vim"
Plug "junegunn/fzf.vim"

-- language-specific
Plug "tikhomirov/vim-glsl"
Plug("dccsillag/magma-nvim", { ["do"] = ":UpdateRemotePlugins" })
Plug "jpalardy/vim-slime"

-- statusline
Plug 'nvim-lualine/lualine.nvim'

-- colors
Plug("sonph/onehalf", { rtp = "vim" })

-- wiki
Plug 'vimwiki/vimwiki'

-- discord
Plug "andweeb/presence.nvim"

vim.call("plug#end")

-- coq
vim.g.coq_settings = {
    auto_start = "shut-up",
    display = {
        ghost_text = {
            context = { "  ", "" },
        },
        pum = {
            fast_close = false,
            kind_context = { " ", "" },
            source_context = { "", "" },
        },
        icons = {
            mode = "none",
        },
    },
    keymap = {
        recommended = false,
        jump_to_mark = "<c-s>",
    },
    match = {
        max_results = 100,
        look_ahead = 4,
        fuzzy_cutoff = 0.5,
    },
}

-- gitgutter
vim.g.gitgutter_close_preview_on_escape = 1
vim.g.gitgutter_set_sign_backgrounds = 1
vim.g.gitgutter_map_keys = 0

-- nerdtree
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 3
vim.g.netrw_winsize = 25
vim.g.NERDTreeDirArrowExpandable = "+"
vim.g.NERDTreeDirArrowCollapsible = "-"
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeNaturalSort = 1
vim.g.NERDTreeSortHiddenFirst = 1
vim.g.NERDTreeChDirMode = 3
vim.g.NERDTreeShowBookmarks = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeSortOrder = { "/$", "^\\.", "^[A-Z]", "*" }
vim.g.NERDTreeIgnore = { "^.git$" }

-- discord
require "presence":setup {
    auto_update        = true,
    neovim_image_text  = "neovim",
    main_image         = "neovim",
    client_id          = "793271441293967371",
    debounce_timeout   = 10,
    enable_line_number = false,
    blacklist          = {},
    buttons            = false,

    editing_text        = "%s",
    file_explorer_text  = "%s",
    git_commit_text     = "committing",
    plugin_manager_text = "managing plugins",
    reading_text        = "%s",
    workspace_text      = "ws: %s",
    line_number_text    = "%s out of %s",
}

-- fzf
vim.g.fzf_preview_window = {
    "right:50%:border-left",
    "ctrl-/"
}
vim.g.fzf_layout = {
    window = {
        width = 0.9,
        height = 0.8,
        border = "sharp"
    }
}

-- ctrlp
vim.g.ctrlp_working_path_mode = "rwa"
vim.g.ctrlp_map = "<C-l>"
vim.g.ctrlp_custom_ignore = {
    dir = 'plugged$\\|target$\\|venv$\\|obj$\\|bin$\\|\\v[\\/]\\.(git|hg|svn)$',
    file = '\\v\\.(exe|so|dll)$',
}
vim.g.ctrlp_open_new_file = "h"

-- vimwiki
vim.g.vimwiki_list = {{path = "~/vimwiki/", syntax = "markdown", ext = ".md"}}

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = {left = '|', right = '|'},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {
            'filename',
            {
                'diagnostics',
                symbols = {error = "", warn = "", info = "", hint = ""},
            },
            {
                'diff',
            },
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {'nerdtree', 'fzf', 'quickfix'},
}
