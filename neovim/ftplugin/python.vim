" normally: autocmd FileType python

filetype indent on                " Enable filetype-specific indenting
setlocal shiftwidth=2 tabstop=2 softtabstop=2
" setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

" " enable debugging
" if filereadable("~/.vim/ftplugin/vimpdb/VimPdb.vim")
"   "source ~/.vim/ftplugin/vimpdb/VimPdb.vim
" endif
"
" Highlight everything possible for python
let g:python_highlight_all=1
"
" " Don't annoy me about the 80 character width limit in python - is not even in
" " pep8 anymore.
" let g:syntastic_python_flake8_post_args='--ignore=E501'
" let g:syntastic_python_flake8_args='--ignore=E501'
"
" " Don't use pylint
" let g:syntastic_python_checkers = ['flake8', 'pyflakes']
"
" " Jedi settings
" let g:jedi#use_tabs_not_buffers = 1
"
"
let g:ale_python_flake8_executable = '/home/spiros/.pyenv/shims/flake8'
let g:ale_python_flake8_use_global = 1
let g:ale_linters = {
\   'python': ['flake8'],
\}

" Formating https://github.com/google/yapf/
nnoremap <silent> ,f :0,$!yapf<CR>

