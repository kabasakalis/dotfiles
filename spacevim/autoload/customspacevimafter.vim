"=======================================================================================================================
" Spiros kabasakalis
" Custom bootstrap_after Configuration for SpaceVim
" Author: Spiros kabasakalis < kabasakalis at gmail.com >
" URL: https://github.com/kabasakalis 
" Copyright (c) 2016-2017 Wang Shidong & Contributors
" License: GPLv3
"=======================================================================================================================

function! customspacevimafter#after() abort
call SpaceVim#logger#info('** Custom bootstrap_after Spacevim settings loaded. **')
nnoremap <silent> [Window]f :copen<CR>
    let g:_spacevim_mappings_windows.f = [':copen',
          \ 'Open Quick fix',
          \ [
          \ '[WIN f] is to open quick fix',
          \ '',
          \ 'Definition: ',
          \ ]
          \ ]

nnoremap <silent> [Window]d :cclose<CR>
    let g:_spacevim_mappings_windows.d = [':cclose',
          \ 'Close Quick fix',
          \ [
          \ '[WIN d] is to close quick fix',
          \ '',
          \ 'Definition: ',
          \ ]
          \ ]



" call SpaceVim#custom#SPC('nnoremap', ['l', 'o'], ':! ls -a ','kakakak', 1)
endfunction "bootstrap_after function body ends here

