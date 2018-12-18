" Shortcuts for denite interface
" Show extension list
nmap <buffer><silent>,re <Plug>(clang_rename-current)
"Show symbols of current buffer
nnoremap <silent> ,ps  :<C-u>Denite coc-symbols<cr>
"Search symbols of current workspace
nnoremap <silent>  ,pw  :<C-u>Denite coc-workspace<cr>
"Show diagnostics of current workspace
nnoremap <silent> ,pd  :<C-u>Denite coc-diagnostic<cr>
"Show available commands
" nnoremap <silent> <space>c  :<C-u>Denite coc-command<cr>
"Show available services
" nnoremap <silent> <space>s  :<C-u>Denite coc-service<cr>
"Show links of current buffer
" nnoremap <silent> <space>l  :<C-u>Denite coc-link<cr>




" Remap keys for got:os
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)


" nmap <silent> <M-j> <Plug>(coc-definition)
" nmap <silent> <C-,> <Plug>(coc-references)
" nn <silent> K :call CocActionAsync('doHover')<cr>


set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
