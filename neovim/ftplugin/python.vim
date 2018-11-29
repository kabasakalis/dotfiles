" Vim filetype plugin
" Language:	Python
" Description: Optimized for Python development.
" Author: Spiros Kabasakalis

set cinoptions=l1
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
filetype indent on                " Enable filetype-specific indenting
" setlocal shiftwidth=2 tabstop=2 softtabstop=2
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Python specific settings.
setlocal autoindent
setlocal formatoptions=croql

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

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
let g:ale_python_flake8_executable = expand("$HOME/.pyenv/shims/flake8")
let g:ale_python_flake8_use_global = 1
let g:ale_linters = {
\   'python': ['flake8'],
\}

" Don't run linters on changing text or opening a file.
" So effectively linters run only on file saved.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


" yapf Formating https://github.com/google/yapf/
nnoremap <silent> ,f :0,$!yapf<CR>

" isort Sort Import Formating https://github.com/google/yapf/
nnoremap <silent> ,si :!isort %<CR><CR>
