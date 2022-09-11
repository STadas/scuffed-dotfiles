setlocal colorcolumn=180

nmap <silent><buffer><leader>fd <Plug>(omnisharp_go_to_definition)
nmap <silent><buffer><leader>fr <Plug>(omnisharp_find_usages)
nmap <silent><buffer><leader>fi <Plug>(omnisharp_find_implementations)
nmap <silent><buffer><leader>ft <Plug>(omnisharp_type_lookup)
nmap <silent><buffer><leader>fdoc <Plug>(omnisharp_documentation)
nmap <silent><buffer><C-\> <Plug>(omnisharp_signature_help)
imap <silent><buffer><C-\> <Plug>(omnisharp_signature_help)
