uthor : Spiros Kabasakalis <Kabasakalis@gmail.com>                                                                ###
" ######################################################################################################################
" ### Vim Configuration  for Windows                                                                                 ###
" ### Vimmer since : Thu Apr 14 2016                                                                                 ###
" ######################################################################################################################

let g:windows_vim = 1
let home_path = $HOME

" Plugins managed with vim-plug {{{
if filereadable(expand("$HOME/plugins.vim"))
   source $HOME/plugins.vim
endif
"}}}


" Core Settings, also used by Visual Studio {{{
if filereadable(expand("$HOME/_vsvimrc"))
   source $HOME/_vsvimrc
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ======================================================================================================================

filetype indent on                " Enable filetype-specific indenting
filetype plugin on                " Enable filetype-specific plugins
set omnifunc=syntaxcomplete#Complete

let mapleader=" "                 " leader
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
" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" Pretty sure you need to mkdir backup, swap, and undo first to make this work

set backupdir="C://Users//spiros//_vimbackup"
set directory="C://Users//spiros//_vimswap"
set undodir="C://Users//spiros//_vimundo"


"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Color and highlighting settings {{{
" ======================================================================================================================

" Available themes:
" jellybeans
" lucid
" railscasts
" Tomorrow-Night
" seoul256
" tropikos
" gotham256
" Color scheme based on time
" Turn syntax highlighting on
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.


if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  " Turn syntax highlighting on
  syntax on
  " start highlighting from 256 lines backwards
  syntax sync minlines=256
endif

let g:rehash256=1
" Theme
colorscheme  Tomorrow-Night
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


" ---------------------------------------------------------------------------------------------------------------------
" Persistent undo settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=$HOME\vimundo
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Timeout settings {{{
" ---------------------------------------------------------------------------------------------------------------------
" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Folding settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set foldmethod=marker             " Markers are used to specify folds.
set foldlevel=2                   " Start folding automatically from level 2
set fillchars="fold: "            " Characters to fill the statuslines and vertical separators
" set foldenable                  " folding
" set foldlevelstart=10
" set foldnestmax=10
" set foldmethod=indent
" set nowrap
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" White characters settings {{{
" ---------------------------------------------------------------------------------------------------------------------
"set list                         " Show listchars by default
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Spelling settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set spelllang=en_us               " Set language to US English
set nospell                       " Disable checking by default (use <F4> to toggle)
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Omni completion settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set completeopt-=preview          " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
" set wildignore+=*.png,*.jpg,*.jpeg
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**
"}}}


" -----------------------------------------------------
" CtrlP Config {{{
" -----------------------------------------------------
"Disable/Enable
" let g:loaded_ctrlp = 1
let g:ctrlp_dont_split = 'nerdtree'
let g:ctrlp_dont_split = 'startify'
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
nnoremap <Leader>o :CtrlP<CR>                 " Open file menu
nnoremap <Leader>b :CtrlPBuffer<CR>           " Open buffer menu
nnoremap <Leader>u :CtrlPMRUFiles<CR>         " Open most recently used files
nnoremap <Leader>m :CtrlPMixed<CR>            " Open Mixed
"}}}

" -----------------------------------------------------
" Startify Config {{{
" -----------------------------------------------------
"autocmd User Startified setlocal cursorline
autocmd User Startified setlocal buftype=
" let g:startify_disable_at_vimenter    = 0
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ '/Users/mhi/local/vim/share/vim/vim74/doc',
            \ ]

let g:startify_bookmarks = [
            \ { 'c': 'c:\Users\spiros\windows_dotfiles\vim\_vimrc' },
            \ { 'd': 'c:\Users\spiros\windows_dotfiles\vim\plugins.vim'},
            \ { 'e': 'c:\Users\spiros\windows_dotfiles\dotfiles.bat'}
            \ ]

let g:startify_list_order = [
            \ ['   Recent'],
            \ 'files',
            \ ['   Recent in current'],
            \ 'dir',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ['   Commands:'],
            \ 'commands',
            \ ]

let g:startify_commands = [
    \ ['Vim Reference', 'h ref']
    \ ]

let g:startify_custom_header = [' ',' ', '   Spiros Kabasakalis', '   Custom Vim Setup']
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

let NERDTreeHijackNetrw = 0
let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]

nnoremap <silent> ,z :Startify<CR>
"}}}

" -----------------------------------------------------
" tree Config {{{
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
let g:NERDTreeWinSize=50
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeMapActivateNode='<right>'
" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
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

autocmd filetype nerdtree syn match haskell_icon #ÎõÎé# containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syn match html_icon #ÎõÎé# containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match go_icon #ÎõÎé# containedin=NERDTreeFile

" nnoremap <silent> <Leader>h :call utils#nerdWrapper()<CR>
nnoremap <silent> <Leader>h :NERDTreeToggle<CR>

" map <Leader>n :NERDTreeToggle<CR>

"}}}


" -----------------------------------------------------
" Sneak, s f https://github.com/justinmk/vim-sneak {{{
" -----------------------------------------------------
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S
"}}}

" -----------------------------------------------------
" Easy Motion {{{
" -----------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `m{char}{label}`
"nmap m <Plug>(tion-overwin-f)
" or
" `m{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"}}}

" -----------------------------------------------------
" Clever F settings {{{
" -----------------------------------------------------
let g:clever_f_across_no_line=1
let g:clever_f_smart_case=1
let g:clever_f_show_prompt=1
let g:clever_f_chars_match_any_signs=';'
"}}}

" -----------------------------------------------------
" Gitgutter {{{
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'
let g:gitgutter_override_sign_column_highlight = 0
set signcolumn=yes

highlight GitGutterAdd ctermfg=green ctermbg=NONE
highlight GitGutterChange ctermfg=yellow ctermbg=NONE
highlight GitGutterDelete ctermfg=red ctermbg=NONE
highlight GitGutterChangeDelete ctermfg=magenta ctermbg=NONE
"}}}

" -----------------------------------------------------
" Airline {{{
" -----------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
" Enable the list of ers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_exclude_preview = 1
"}}}

" -----------------------------------------------------
" Dev Icons {{{
" -----------------------------------------------------
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
" let g:webdevicons_enable_ctrlp = 1
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
"}}}


" -----------------------------------------------------
" Pasta  Pasting in Vim with indentation adjusted to destination context.{{{
" -----------------------------------------------------
let g:pasta_paste_before_mapping = ',O'
let g:pasta_paste_after_mapping = ',o'
"}}}


" -----------------------------------------------------
" Smooth scroll vim-smooth-scroll {{{
" -----------------------------------------------------
"noremap <silent> <c-key> :call smooth_scroll#up(&scroll, 0, 2)<CR>
"noremap <silent> <c-key> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-o> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"}}}

" -----------------------------------------------------
" Ctrl-SF {{{
"
" -----------------------------------------------------
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_mapping = {
      \ "next"    : "n",
      \ "prev"    : "N",
      \ "quit"    : "q",
      \ "popen"   : "p",
      \ "pquit"   : "q",
      \ "split"   : "s",
      \ "openb"   : "",
      \ "tab"     : "",
      \ "tabb"    : "",
      \ "loclist" : "",
      \ }

let g:ctrlsf_auto_close = 1
let g:ctrlsf_case_sensitive = 'no'
let g:ctrlsf_default_root = 'cwd'
let g:ctrlsf_confirm_save = 1
let g:ctrlsf_ignore_dir = ['bower_components', 'npm_modules', 'doc', 'log', 'public']
let g:ctrlsf_selected_line_hl = 'op'
let g:ctrlsf_populate_qflist=1
let g:ctrlsf_position='right'
let g:ctrlsf_winsize = '50%'
let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=1
"let g:ctrlsf_context = '-C 3'
"
nnoremap <leader>gg :CtrlSF<Space>
nnoremap <leader>gG :CtrlSFToggle<Space>

nnoremap <silent> ,g :call utils#searchCurrentWordWithAg()<CR>

nmap     <C-S>f <Plug>CtrlSFPrompt
vmap     <C-S>f <Plug>CtrlSFVwordPath
vmap     <C-S>F <Plug>CtrlSFVwordExec
nmap     <C-S>n <Plug>CtrlSFCwordPath
nmap     <C-S>p <Plug>CtrlSFPwordPath
nnoremap <C-S>o :CtrlSFOpen<CR>
nnoremap <C-S>t :CtrlSFToggle<CR>
inoremap <C-S>t <Esc>:CtrlSFToggle<CR>
nmap     <C-S>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-S>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-S>L <Plug>CtrlSFQuickfixVwordExec

"}}}

" -----------------------------------------------------
" Vim-Plug {{{
" -----------------------------------------------------
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>
"}}}

" -----------------------------------------------------
" Ultisnips for snippets {{{
" -----------------------------------------------------
" Disable built-in <C-x><C-k> to be able to go backward
inoremap <C-x><C-k> <NOP>
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<C-t>" " used to be tab, but reserved tab for completion manager
let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsEditSplit="vertical"
set runtimepath+= "C:\\Users\\spiros\\vimsnippets"
" the following directories reside in .vimsnippets,
" note that there's also a snipmate folder which is not compatible with
" ultisnips, but some snippets work if a suffix is added with a  missing endsnippet.
" you have to manually do that and move them to the folders below.
let g:UltiSnipsSnippetDirectories=[ "ultisnips", "custom" ]
"user defined snippets
let g:UltiSnipsSnippetsDir= "C:\\Users\\spiros\\vimsnippets\\custom"
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsJumpForwardTrigger='<leader>n'

" let g:UltiSnipsJumpBackwardTrigger='<leader>='
"}}}


" -----------------------------------------------------
" YouCompleteMe {{{
" -----------------------------------------------------
" let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
"}}}


" -----------------------------------------------------
" Vim Markdown settings {{{
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
"}}}


" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall!
cnoremap <ESC><ESC> qall!<CR>

"Delete Current File
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR>

" Toggle between normal and relative numbering.
nnoremap <leader>\ :call utils#NumberToggle()<cr>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
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


" Intelligent windows resizing using ctrl + arrow keys
" Easier for Poker 3.
nnoremap <silent> <Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

" Quicker window movement
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" Quick-fix window navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" vim-test mappings
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>. :TestLast<CR>
"map <silent> <leader>g :TestVisit<CR>

" allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call utils#ExecuteMacroOverVisualRange()<CR>

" CTags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap ,ts :ts<CR>
"nnoremap ,tg :GenerateTags<CR>


"" Turn off recording
map q <Nop>


" -----------------------------------------------------
" Custom commands and functions {{{
" ======================================================================================================================

"Delete current file
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'Succeeded.' : 'Failed.')

" Open Rails consoles in dedicated tab
command! -register RailsConsoles :call utils#RailsConsoles()

" Open DefaultWorkspace
command! -register DW :call utils#DefaultWorkspace()

" Generate tags definitions gem install --no-user-install starscope
command! GenerateTags :call utils#generateCtags()

" Reformat whole or selection from file, format
" Needs: npm install js-beautify, gem install ruby-beautify, python
command! Format :call utils#formatFile()
nnoremap <silent> ,f :Format<CR>

" Annotate file (show values in special # => comments)
" See gem install --no-user-install seeing_is_believing
command! Annotate :call utils#annotateFile()
nnoremap <silent> ,a :Annotate<CR>

" Profile
command! Profile :call utils#profile()

" Retab
command! Retab :call utils#retabToFourSpaces()
"}}}

" -----------------------------------------------------
" Autocommands {{{
" ======================================================================================================================

" Recognize python
au BufNewFile,BufRead *.py set filetype=python

" Turn spellcheck on for markdown files
autocmd BufNewFile,BufRead *.md setlocal spell

" Remove trailing whitespaces automatically before save
autocmd BufWritePre * call utils#stripTrailingWhitespaces()

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"}}}


" -----------------------------------------------------
" F-key actions {{{
" =====================================================

"F1 Cannot be assigned for some reason in Ubuntu 16.04

"F2 Source (reload configuration)
nnoremap <silent> <F2> :so $HOME\_vimrc<CR>

"F4 Toggle white characters visibility
nnoremap <silent> <F4> :set list!<CR> :set list?<CR>

"F12 Show F keys toggles
nnoremap <F12> :call utils#showToggles()<CR>

