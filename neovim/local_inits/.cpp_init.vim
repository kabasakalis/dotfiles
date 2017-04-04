" NeoVim Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Spiros Kabasakalis
"

set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="Spiros Kabasakalis <kabasakalis@gmail.com>"

"F7  switch between header/source
nnoremap <silent> <F7> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"F8 recreate tags file with
nnoremap <silent> <F8> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>

"F9 create doxygen comment
nnoremap <silent> <F9> <C-]>

"F10 goto definition with
nnoremap <silent> <F10> :dox<cr>

"F11 build using makeprg
nnoremap <silent> <F11> :make<CR>
nnoremap <silent> <S-F11> :make clean all<CR>
