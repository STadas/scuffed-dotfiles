" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" Do not load defaults if ~/.vimrc is missing
let skip_defaults_vim=1

lua require 'init'

highlight SpellBad ctermbg=none cterm=underline

" ===== RIPGREP =====
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" ===== FILETYPES =====
au BufRead,BufNewFile *.frag set filetype=glsl
au BufRead,BufNewFile *.tex set filetype=tex
au BufRead,BufNewFile *.qrc set filetype=xml

" ===== LIGHTLINE =====
fu! LinterStatus() abort
    return luaeval("LinterStatus()")
endfu
fu! GitStatus() abort
    return luaeval("GitStatus()")
endfu

let g:lightline={
    \ 'colorscheme': 'tadscheme',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \             [ 'diagnostic', 'gitstatus' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \   'diagnostic': 'LinterStatus',
    \   'gitstatus': 'GitStatus',
    \ },
    \ }

" too annoying to move with the string handling
" ===== SLIME =====
let g:slime_target="tmux"
let g:slime_paste_file=tempname()
let g:slime_default_config={"socket_name": get(split($TMUX, ","), 0), "target_pane": "repl:0.0"}
let g:slime_bracketed_paste=1

" coq
inoremap <silent><expr> <Esc>  pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
inoremap <silent><expr> <CR>   pumvisible() ? "\<C-e><CR>" : "\<CR>"
inoremap <silent><expr> <C-c>  pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
inoremap <silent><expr> <BS>   pumvisible() ? "\<C-e><BS>"  : "\<BS>"
inoremap <silent><expr> <Tab>  pumvisible() ? (complete_info().selected == -1 ? "\<Tab>" : "\<C-y>") : "\<Tab>"
