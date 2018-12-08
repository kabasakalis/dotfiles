
" Denite configuration used in <leader>b mapping for content search
" See customspacevim.vim for keybinding definiton.

call denite#custom#source( 'grep', 'matchers', ['matcher_regexp'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
"
nnoremap <silent> [Window]f :copen<CR>
    let g:_spacevim_mappings_windows.f = [':copen',
          \ 'Open Quick fix',
          \ [
          \ '[WIN f] is to open quick fix',
          \ '',
          \ 'Definition: ',
          \ ]
          \ ]


