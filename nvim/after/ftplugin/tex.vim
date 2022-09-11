setlocal wrap
" set conceallevel=0

nmap <leader>cc :![[ \! -d dist ]] &&
    \ mkdir dist;
    \ pdflatex -output-directory dist main.tex &&
    \ bibtex dist/main.aux &&
    \ pdflatex -output-directory dist main.tex &&
    \ pdflatex -output-directory dist main.tex<CR><CR>
nmap <leader>vv :!okular dist/main.pdf & disown<CR><CR>
nmap <leader>cv <leader>cc<leader>vv
