" Vim filetype plugin
" Language:	C++
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Spiros Kabasakalis


" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Behaves just like C
runtime! ftplugin/c.vim ftplugin/c_*.vim ftplugin/c/*.vim


" -----------------------------------------------------
" Core settings for C++ {{{
" -----------------------------------------------------

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
set comments=sl:/*,mb:\ *,elx:\ */
"}}}
"
" " Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" " This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" " Load standard tag files
" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/qt4

" " ---------------------------------------------------------------------------------------------------------------------
" " c-support  https://github.com/WolfgangMehner/c-support
" " ---------------------------------------------------------------------------------------------------------------------
" let  g:C_UseTool_cmake    = 'yes'
" let  g:C_UseTool_doxygen  = 'yes'
" "}}}


" ---------------------------------------------------------------------------------------------------------------------
"vim-cpp-enhanced-highlight
" ---------------------------------------------------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1
"}}}



" -----------------------------------------------------
" clang-format {{{
" -----------------------------------------------------

"Coding Style llvm, google, chromium, mozilla, default is google
" clang-format -dump-config to see configured options.
" https://clang.llvm.org/docs/ClangFormatStyleOptions.html
let g:clang_format#code_style = 'google'
" let g:clang_format#style_options = {
"    \ "AccessModifierOffset" : -4,
"    \ "AllowShortIfStatementsOnASingleLine" : "true",
"    \ "AlwaysBreakTemplateDeclarations" : "true",
"    \ "Standard" : "C++11",
"    \ "BreakBeforeBraces" : "Attach"
" }
" map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" map to ,cf in C++ code
nnoremap <buffer>,c :<C-u>ClangFormat<CR>
vnoremap <buffer>,c :<C-u>ClangFormat<CR>

" Toggle auto formatting:
nmap ,cf :ClangFormatAutoToggle<CR>

"}}}



" -----------------------------------------------------
" LLDB {{{
" -----------------------------------------------------

highlight LLBreakpointSign ctermfg=cyan guifg=clang_make_default_keymappings

nnoremap ,lin :LLstdin<CR>
nnoremap ,lsn :LLsession new<CR>
nnoremap ,lss :LLsession show<CR>
nnoremap ,lsr :LLsession reload<CR>
nnoremap ,lmd :LLmode debug<CR>
nnoremap ,lmc :LLmode code<CR>

nnoremap ,lpc :LL process launch<CR>
nnoremap ,lpk :LL process kill<CR>
nnoremap ,lpi :LL process interrupt<CR>

nnoremap ,lbd :LL breakpoint delete
nnoremap ,lb <Plug>LLBreakSwitch
nnoremap ,lbl :LL breakpoint list
nnoremap ,lc :LL continue<CR>

" key mapping like debugging shortcut from Intellij
nnoremap ,lso :LL next<CR> " step over
nnoremap ,lsi :LL thread step-in<CR> " step into
nnoremap ,lf :LL finish<CR> " step out of frame

" watchpoints
nnoremap ,lwv :LL watchpoint set variable " set watchpoint to variable
nnoremap ,lwe :LL watchpoint set expession -- " set watchpoint to expession
nnoremap ,lwl :LL watchpoint list<CR> " list watchpoints
nnoremap ,lwd :LL watchpoint delete " delete watchpoint

"frame
nnoremap ,lfv :LL frame variable<CR> " list frame variables
nnoremap ,lv :LL frame variable" show variable
nnoremap ,ltt :LL target variable<CR> " Show the global/static variables defined in the current source file.
nnoremap ,ltv :LL target variable" Show the global/static variable


nnoremap ,lil :LL image list  "Show executable and shared libraries

" step in/out in current thread level
nnoremap ,ltsi :LL thread step-inst<CR>
nnoremap ,ltso :LL thread step-inst-over<CR>

nnoremap ,lp :LL print <C-R>=expand('<cword>')<CR>
vnoremap ,lps :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

"}}}


" -----------------------------------------------------
" C++ clang_complete#ClangComplete  {{{
" -----------------------------------------------------

"Integration with CMake
" set environmental variable for cmake to create .clang_complete file in build directory
" move somehow the file to project root. (automate with CMake TODO)
"CXX="$HOME/.config/nvim/plugins/clang_complete/bin/cc_args.py clang++" cmake ..  && make
"
" or using compilation_database (compile_commands.json) best option
"cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=TRUE .. && make

au FileType c,cpp,objc,objcpp setl omnifunc=clang_complete#ClangComplete
let g:deoplete#omni#input_patterns.cpp = ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*']
" let g:deoplete#sources.cpp = ['buffer', 'member', 'file' , 'ultisnips']
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_use_library=1
let g:clang_complete_copen=1
let g:clang_snippets=1
let g:clang_snippets_engine = 'ultisnips'
" let g:clang_snippets_engine = 'clang_complete'
let g:clang_complete_optional_args_in_snippets=1
let g:clang_close_preview=1
let g:clang_trailing_placeholder=1
let g:clang_complete_macros=1
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_debug = 1
" let g:clang_user_options=' .clang_complete, path'
if filereadable(expand("./build-debug/compile_commands.json"))
  let g:clang_auto_user_options = 'compile_commands.json'
  let g:clang_compilation_database = './build-debug'
endif

"}}}


" "F7  switch between header/source
" nnoremap <silent> <F7> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"
" "F8 recreate tags file with
" " nnoremap <silent> <F8> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
"
" "F9 create doxygen comment
" nnoremap <silent> <F9> <C-]>
"
" "F10 goto definition with
" nnoremap <silent> <F10> :dox<cr>
"
" "F11 build using makeprg
" nnoremap <silent> <F11> :make<CR>
" nnoremap <silent> <S-F11> :make clean all<CR>
