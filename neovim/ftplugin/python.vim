" normally: autocmd FileType python

filetype indent on                " Enable filetype-specific indenting
setlocal shiftwidth=2 tabstop=2 softtabstop=2
" setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
"
" Highlight everything possible for python
let g:python_highlight_all=1

" " enable debugging
" if filereadable("~/.vim/ftplugin/vimpdb/VimPdb.vim")
"   "source ~/.vim/ftplugin/vimpdb/VimPdb.vim
" endif


" " Jedi settings
" let g:jedi#use_tabs_not_buffers = 1

"  -------------------------------------------
"  w0rp/ale, Asynchronous maker and linter, Options for Python {{{
" https://github.com/w0rp/ale/blob/master/doc/ale.txt
" ----------------------------------------------------
let g:ale_enabled = 1
let g:ale_python_flake8_executable = expand("SHOME/.pyenv/shims/flake8")
let g:ale_python_flake8_use_global = 1
let g:ale_linters = {
\   'python': ['flake8'],
\}
"}}}


" yapf Formating https://github.com/google/yapf/
nnoremap <silent> ,f :0,$!yapf<CR>

" isort Sort Import Formating https://github.com/google/yapf/
nnoremap <silent> ,si :!isort %<CR><CR>

