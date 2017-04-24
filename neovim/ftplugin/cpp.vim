" Vim filetype plugin file
" Language:	C++
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jan 15

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Behaves just like C
runtime! ftplugin/c.vim ftplugin/c_*.vim ftplugin/c/*.vim


" NeoVim Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Spiros Kabasakalis
"
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
set comments=sl:/*,mb:\ *,elx:\ */

" " Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" " This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" " Load standard tag files
" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/qt4

" ---------------------------------------------------------------------------------------------------------------------
" c-support  https://github.com/WolfgangMehner/c-support
" ---------------------------------------------------------------------------------------------------------------------
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen  = 'yes'
"}}}


" ---------------------------------------------------------------------------------------------------------------------
" DoxygenToolkit
" ---------------------------------------------------------------------------------------------------------------------
let g:DoxygenToolkit_authorName="Spiros Kabasakalis <kabasakalis@gmail.com>"
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="-------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_licenseTag="My own license"
"}}}


" ---------------------------------------------------------------------------------------------------------------------
"vim-cpp-enhanced-highlight
" ---------------------------------------------------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1
"}}}


"F7  switch between header/source
nnoremap <silent> <F7> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"F8 recreate tags file with
" nnoremap <silent> <F8> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>

"F9 create doxygen comment
nnoremap <silent> <F9> <C-]>

"F10 goto definition with
nnoremap <silent> <F10> :dox<cr>

"F11 build using makeprg
nnoremap <silent> <F11> :make<CR>
nnoremap <silent> <S-F11> :make clean all<CR>
