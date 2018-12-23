"  ---------------------------------------------------------------------------------------------------------------------
" Plugin configuration 
" ----------------------------------------------------------------------------------------------------------------------

call SpaceVim#logger#info('** Plugin Settings custom configuration loaded from plugin/settings.vim  **')

"  ---------------------------------------------------------------------------------------------------------------------
" Denite configuration used in <leader>b mapping for content search
" See customspacevim.vim for keybinding definiton.
" ----------------------------------------------------------------------------------------------------------------------
call denite#custom#source( 'grep', 'matchers', ['matcher_regexp'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'separator', ['--'])


" ----------------------------------------------------------------------------------------------------------------------
" Ultisnips for snippets
" ----------------------------------------------------------------------------------------------------------------------

" Disable built-in <C-x><C-k> to be able to go backward
inoremap <c-x><c-k> <c-x><c-k>
let g:UltiSnipsListSnippets='<C-l>'
set runtimepath+=~/vimsnippets
" the following directories reside in vimsnippets,
let g:UltiSnipsSnippetDirectories=[ "ultisnips", "custom" ]
"user defined snippets
let g:UltiSnipsSnippetsDir= "~/vimsnippets/custom"
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsEditSplit = 'vertical' 
let g:UltiSnipsJumpForwardTrigger='<C-u>'
let g:UltiSnipsJumpBackwardTrigger='<C-o>'
let g:clang_snippets_engine = 'ultisnips'

"  ---------------------------------------------------------------------------------------------------------------------
"  w0rp/ale, Asynchronous maker and linter 
" ----------------------------------------------------------------------------------------------------------------------
let g:ale_sign_column_always = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
 nmap <leader>d <Plug>(ale_detail)
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Don't run linters on changing text or opening a file.
" So effectively linters run only on file saved.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_close_preview_on_insert=1
" let g:ale_cursor_detail=1
let g:ale_list_vertical=0
let g:ale_history_log_output=1

"This variable can be changed to customize ccls initialization options.
let g:ale_c_ccls_init_options =                           
      \  {
    \   'cacheDirectory': '/tmp/ccls',
    \   'cacheFormat': 'binary',
    \   'diagnostics': {
    \     'onOpen': -1,
    \     'onChange': -1,
    \     'onSave': -1,
    \   },
    \ }

if has("win32")
  " Windows Options GVim
  "GNU
  let g:ale_cpp_gcc_executable = 'F:/msys64/mingw64/bin/g++'
  let g:ale_c_gcc_executable = 'F:/msys64/mingw64/bin/gcc'
  "CLANG
  let g:ale_c_clang_executable = 'F:/msys64/mingw64/bin/clang'
  " let g:ale_c_ccls_executable = 'ccls'
  let g:ale_c_build_dir_names = ['build', 'bin']
  " let g:ale_c_build_dir = 'build'
  " let g:ale_c_parse_makefile = 1
  let g:ale_set_balloons = 1 
  ""* C++ (filetype cpp): `clang`, `clangd`, `clangcheck`!!, `clangtidy`!!, `clang-format`, `clazy`!!, `cppcheck`, `cpplint`!!, `cquery`, `flawfinder`, `gcc`, `uncrustify`, `ccls`
  " let g:ale_linters = { 'cpp': ['ccls', 'clangtidy']}
  let g:ale_linters = { 'cpp': [ 'clangtidy']}
  let g:ale_fixers = { 'cpp': ['clang-format']}
" g:ale_linters_explicit = 1
  let g:ale_cpp_gcc_options="-Wall -O3"
  let g:ale_c_gcc_options="-Wall -O2"
elseif has("unix")
  " Linux Options Neovim
  let g:ale_cpp_gcc_executable = '/usr/bin/gcc'
  let g:ale_c_gcc_executable = '/usr/bin/gcc'
else
endif

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge


" ----------------------------------------------------------------------------------------------------------------------
" Dev Icons 
" ----------------------------------------------------------------------------------------------------------------------
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
" let g:webdevicons_enable_ctrlp = 1
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif



