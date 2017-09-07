


" j and k don't skip over wrapped lines in following FileTypes, unless given a
" count (helpful since I display relative line numbers in these file types)
" (https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/cliuz1o)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'


" -----------------------------------------------------
" Enable seeing-is-believing mappings only for Ruby {{{
" ======================================================================================================================
augroup seeingIsBelievingSettings
  autocmd!
   nmap <buffer> ,b <Plug>(seeing-is-believing-mark-and-run)
   xmap <buffer> ,b <Plug>(seeing-is-believing-mark-and-run)
   nmap <buffer> ,m <Plug>(seeing-is-believing-mark)
   xmap <buffer> ,m <Plug>(seeing-is-believing-mark)
   imap <buffer> ,m <Plug>(seeing-is-believing-mark)
   nmap <buffer> ,b <Plug>(seeing-is-believing-run)
   imap <buffer> ,b <Plug>(seeing-is-believing-run)
augroup END
"}}}

