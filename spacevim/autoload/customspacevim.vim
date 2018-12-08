function! customspacevim#before() abort
call SpaceVim#logger#info('** Custom Spacevim settings loaded. **')
" ======================================================================================================================
" Core Vim settings  {{{
" ======================================================================================================================
if has("win32")
  " Windows Options GVim
 let g:python3_host_prog = "C:\tools\python-3.6.6\python.exe"
elseif has("unix")
  " Linux Options Neovim
" let g:python_host_prog  = "/home/spiros/.pyenv/versions/neovim2/bin/python"
else
endif


filetype indent on                " Enable filetype-specific indenting
filetype plugin on                " Enable filetype-specific plugins
set guicursor=
let g:mapleader = ';'             " leader, leave SPACE for spacvim
set nocompatible                  " choose no compatibility with legacy vi
set hidden
set runtimepath+=~/
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set linebreak                     " And when Vim does wrap lines, have it break the lines on spaces and punctuation only (http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
set textwidth=120                 " Make it obvious where 120(80) characters is
set colorcolumn=+1
set number
set numberwidth=2
set scrolloff=5                   " Screen scrolls 5 lines in front of the cursor
set sidescrolloff=3
set backspace=2                   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile                    "New buffers will be loaded without creating a swapfile  http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=1000
set ruler                         " show the cursor position all the time
set showcmd                       " display incomplete commands
set laststatus=2                  " Always display the status line
set autowrite                     " Automatically :write before running commands
"set cursorline                   " Highlight current line
set clipboard+=unnamed            " Allow to use system clipboard
set showmatch                     " Show matching brackets when text indicator is over them
set matchtime=2                   " How many tenths of a second to blink when matching brackets
set nostartofline                 " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block             " To be able to select past EOL in visual block mode
set updatetime=1000               " Update time used to create swap file or other things
set nojoinspaces                  " No extra space when joining a line which ends with . ? !
set splitbelow                    " Open new split panes to right and bottom, which feels more natural
set splitright
set mouse-=a                      " disable mouse support, what am I a vimposer?
set complete+=kspell              " Autocomplete with dictionary words when spell check is on
set diffopt+=vertical             " Always use vertical diffs
set wildmenu                      " turn on the wildmenu cuz everyone says to
set autoread                      " have vim re-load files when they're changed outside of vim
set formatoptions+=j              " Delete comment charalter when joining commented lines
set sc                            " show commands as you type them
set lazyredraw                    " make vim a little speedier
set ttyfast
set tags=./tags;                  " Set the tag file search order
" au FileType qf wincmd :botright           " Quickfix window always full width
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Color and highlighting settings {{{
" ======================================================================================================================


" if (has("termguicolors"))
"   set termguicolors
" endif

" Switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  " Turn syntax highlighting on
  syntax on
  " start highlighting from 256 lines backwards
  syntax sync minlines=256
endif

let g:rehash256=1

"transparency
hi Normal  ctermfg=252 ctermbg=none

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"" Error highlight
highlight	Error ctermfg=red ctermbg=blue guifg=red ctermbg=NONE

"" Spell highligh"" Spell highlightt
highlight SpellBad ctermfg=red ctermbg=black guifg=red ctermbg=NONE

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green

" Listchars highlighting
highlight NonText ctermfg=235 guifg=gray
highlight SpecialKey ctermfg=235 guifg=gray

" Remove underline in folded lines
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" LineNumber Gutter background color
highlight LineNr ctermfg=NONE ctermbg=NONE

" SignColumn (Git Gutter)
highlight SignColumn ctermfg=NONE ctermbg=NONE

" Link highlight groups to improve buftabline colors
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment
"}}}


"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Search settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set ignorecase                    " Ignore case by default
set smartcase                     " Make search case sensitive only if it contains uppercase letters
set wrapscan                      " Search again from top when reached the bottom
set nohlsearch                    " Don't highlight after search
set incsearch                     " incremental searching
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Core key bindings-remappings {{{
" ======================================================================================================================

" Save file
nnoremap <Leader>s :w<CR>

" Quicker window movement
" up and down have been  mapped to tmux window navigation, not used in Windows.
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap ,r zR

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Buffers navigation and management
nnoremap <leader>] :bn<CR>
nnoremap <leader>[  :bp<CR>
"Close buffer workaround
map <C-x> :bn<cr>:bd #<cr>:bp<cr>

"Close all buffers
"map <C-c> :bufdo bd<cr>

" Quickly open a vertical split of my custom spacevim settings.
nnoremap  <leader>ev :vs ~\dotfiles\spacevim\customspacevim.vim<CR>

" H to beginning of line, L to the end
noremap H ^
noremap L $

" D deletes to the end of the line, and Y yanks to end of line
nnoremap D d$
nnoremap Y y$

" place whole file on the system clipboard (and return cursor to where it was)
nmap <Leader>a maggVG"*y`a

" Select all contents of file
nmap <Leader>v <esc>ggVG<CR>

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]
" Yank and paste from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p

" have x (removes single character) not go into the default registry
nnoremap x "_x
" Make X an operator that removes without placing text in the default registry
nmap X "_d
nmap XX "_dd
vmap X "_d
vmap x "_d

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" Reselect last-pasted text
nnoremap gp `[v`]

" Move visual block with page UP and page DOWN
vnoremap U :m '<-2<CR>gv=gv
vnoremap O :m '>+1<CR>gv=gv

" Fix the cw at the end of line bug default Vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Keep the cursor in place while joining lines, (Enter at cursor splits lines)
nnoremap J mzJ`z

" Start substitute,replace on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Faster sort
vnoremap ;s :!sort<CR>

" Easier fold toggling
" Toggle
nnoremap ,n za
" Close all
nnoremap ,m zM
" Open  all
nnoremap ,r zR

" Enter gives a new line when in command mode without entering insert mode. Likewise, shift+enter gives a new line
" above the cursor
nmap <CR> o<Esc>
nnoremap <S-Enter> O<Esc>

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" Center screen when jumping to next match
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Center screen when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-o> <C-o>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-o> <C-o>zz

"" Split line (opposite of J)
nnoremap <CR> i<CR><Esc>

"}}}


"Example for SPC group key binding 
"call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
"call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)

"Example  for SPC key binding with existing group 
"call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'echom "hello world"', 'test custom SPC', 1)

" ---------------------------------------------------------------------------------------------------------------------
" Additional remappings of important Spacevim key bindings to leader mappings for less
" keystrokes {{{
" ======================================================================================================================

" Format
nmap  ff        <Space>bf
" Home screen
nmap  <leader>h <Space>bh
" Kill buffer
nmap <leader>k  <Space>bd

" Save all buffers
nmap <leader>S  <Space>fS

" Next buffer may not work in UBUNTU
nmap <M-l>  <Space>bn

" Previous buffer may not work in UBUNTU
nmap <M-h>  <Space>bp

" Swap buffer
nmap <leader>m  <Space>wM

" Comment lines or visual blocks
nmap <leader>c <Space>cl
vmap <leader>c <Space>cl

" Toggle File Tree
nmap <leader>t  <Space>ft

" Delete current buffer and file, confirmation, CAUTION.
nmap <leader>D  <Space>fD

" Edit Spacevim configuration
nmap <leader>g  <Space>fvd

" Easy Motion Word 
nmap <leader>j  <Space>jw

" Cycle theme 
nmap <leader>u  <Space>Tn

" Transpose character, word or line. 
nmap <leader>x  <Space>xt

" Content Search  with ag
" ag must be installed and in the path 
nmap <leader>f  <Space>sa

" Switch to previous window
nnoremap <silent> [Window]s <C-w><C-p>

" Content search with Denite and ag, opend quick fix
map <leader>b :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>

" File search in current project with Denite
call SpaceVim#custom#SPC('nnoremap', ['f', 'p'], ':DeniteProjectDir file/rec<CR>', 'Find files in project (Denite) - *', 1)

" File search in current open buffers with Denite
call SpaceVim#custom#SPC('nnoremap', ['f', 'b'], ':Denite buffer<CR>', 'Find files in open buffers (Denite) - *', 1)

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Better help navigation with ENTER and BACKSPACE
:au filetype help :nnoremap <buffer><CR> <c-]>
:au filetype help :nnoremap <buffer><BS> <c-T>




"}}}

" ======================================================================================================================
" Plugin Settings 
" ======================================================================================================================

call SpaceVim#logger#info('** Custom Spacevim plugin settings loaded. **')

let g:spacevim_statusline_right_sections =
    \ [
    \ 'fileformat',
    \ 'cursorpos',
    \ 'percentage',
    \ 'time',
    \ 'date'
    \ ]




" -----------------------------------------------------
" Nerdtree Config {{{
" -----------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=40
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeMapActivateNode='<right>'
let g:NERDTreeWinPos = "left"
let g:NERDTreeChDirMode = 0
autocmd filetype nerdtree syn match haskell_icon #?# containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
" autocmd filetype nerdtree syn match html_icon #?# containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match go_icon #?# containedin=NERDTreeFile


call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('haml', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('scss', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('rb', 'Cyan', 'none', 'red', '#151515')
call NERDTreeHighlightFile('png', 'Cyan', 'none', 'red', '#151515')
call NERDTreeHighlightFile('jpg', 'Cyan', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('zshrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')


" ======================================================================================================================
" Startify {{{ 
" ======================================================================================================================

"autocmd User Startified setlocal cursorline
autocmd User Startified setlocal buftype=
" let g:startify_disable_at_vimenter    = 0
let g:startify_enable_special         = 0
let g:startify_files_number           = 10
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 0
let g:startify_change_to_vcs_root     = 0
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let NERDTreeHijackNetrw = 0

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent']            }, { 'type': 'dir',       'header': ['   Recent in '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" let g:startify_custom_indices = ['1', '2', '3']
let g:startify_bookmarks = [
            \ { '1': '~/dotfiles/neovim/init.vim' },
            \ { '2': '~/dotfiles/neovim/plugins.vim'},
            \ { '3': '~/dotfiles/neovim/autoload/utils.vim'},
            \ { '4': '~/dotfiles/zsh/zshrc'},
            \ { '5': '~/dotfiles/zsh/zshenv'},
            \ { '6': '~/dotfiles/zsh/zsh_aliases'},
            \ { '7': '~/dotfiles/install.conf.yaml'},
            \ { '8': '~/dotfiles/spacevim/init.toml'},
            \ { '9': '~/dotfiles/spacevim/autoload/customspacevim.vim'},
            \ { '10': '~/dotfiles/spacevim/plugin/pluginssettings.vim'}
            \ ]

let g:startify_commands = [
    \ ['Vim Reference', 'h ref'],
    \ ['Spacevim Configuration', 'h Spacevim-config']
    \ ]


let g:startify_custom_footer =
      \ ['', "   Neither the past, the present nor the future mind can be found", '']

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240
"
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]

let g:startify_custom_header = [
        \ '   _____       _                 _  __     _                     _         _ _      ',
        \ '  / ____|     (_)               | |/ /    | |                   | |       | (_)     ',
        \ ' | (___  _ __  _ _ __ ___  ___  |   / __ _| |__   __ _ ___  __ _| | ____ _| |_ ___  ',
        \ '  \___ \|  _ \| |  __/ _ \/ __| |  < / _` | |_ \ / _` / __|/ _` | |/ / _` | | / __| ',
        \ '  ____) | |_) | | | | (_) \__ \ | . \ (_| | |_) | (_| \__ \ (_| |   < (_| | | \__ \ ',
        \ ' |_____/| .__/|_|_|  \___/|___/ |_|\_\__,_|_.__/ \__,_|___/\__,_|_|\_\__,_|_|_|___/ ',
        \ '        | |                                                                         ',
        \ '        |_|                                                                         ',
        \ '                            Custom Spacevim Setup                                   ',
        \ ]

"}}}






" -----------------------------------------------------
" Ultisnips for snippets
" -----------------------------------------------------

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


"  ---------------------------------------------------
"  w0rp/ale, Asynchronous maker and linter 
" ----------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Don't run linters on changing text or opening a file.
" So effectively linters run only on file saved.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_close_preview_on_insert=1
let g:ale_cursor_detail=1
let g:ale_list_vertical=0
if has("win32")
  " Windows Options GVim
  let g:ale_cpp_gcc_executable = 'C:/mingw64/bin/gcc'
  let g:ale_c_gcc_executable = 'C:/mingw64/bin/gcc'
  let g:ale_linters = {'c': ['gcc'], 'cpp': ['gcc']}
  let g:ale_cpp_gcc_options="-Wall -O3"
  let g:ale_c_gcc_options="-Wall -O2"
elseif has("unix")
  " Linux Options Neovim
  let g:ale_cpp_gcc_executable = '/usr/bin/gcc'
  let g:ale_c_gcc_executable = '/usr/bin/gcc'
else
endif




endfunction

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

let s:HI = SpaceVim#api#import('vim#highlight')

function! s:cursor_highlight() abort
    echo s:HI.syntax_at()
endfunction

function! s:defx_my_settings() abort
    " Define mappings
endfunction




