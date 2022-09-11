setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

function! TabNERDClose()
    let current_tab = tabpagenr()
    tabdo NERDTreeClose
    execute 'tabnext' current_tab
endfunction

map <S-q> :call TabNERDClose()<CR>
