" ######################################################################################################################
" ### Author : Spiros Kabasakalis <Kabasakalis@gmail.com>                                                            ###
" ######################################################################################################################
" ### Neovim Configuration                                                                                           ###
" ### Neovimmer since : Thu Apr 14 2016                                                                              ###                                                                             ###
" ######################################################################################################################


let home_path = $HOME

"Plugins managed with vim-plug {{{
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ======================================================================================================================
"https://neovim.io/doc/user/provider.html#provider-python
" let g:python_host_prog  = '/usr/bin/python2'
" let g:python3_host_prog = expand("$HOME/.pyenv/shims/python3")

" Virtual Python Environments
"https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
" let g:python_host_prog  = expand("SHOME/.pyenv/versions/neovim2/bin/python")
" let g:python3_host_prog = expand("$HOME/.pyenv/versions/neovim3/bin/python")

let g:python_host_prog  = "/home/spiros/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/home/spiros/.pyenv/versions/neovim3/bin/python"

" let g:loaded_python_provider = 1 "To disable Python 2 support:
" let g:loaded_python3_provider = 1 " To disable Python 3 support:

filetype indent on                " Enable filetype-specific indenting
filetype plugin on                " Enable filetype-specific plugins

set guicursor=
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
set backupdir=~/.config/nvim/backup/
set directory=~/.config/nvim/swap
set undodir=~/.config/nvim/undo

set tags=./tags;                  " Set the tag file search order
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

"" Available themes:
" jellybeans
" lucid
" railscasts
" Tomorrow-Night
" seoul256
" tropikos
" gotham256
" Color scheme based on time
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
" Search settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set ignorecase                    " Ignore case by default
set smartcase                     " Make search case sensitive only if it contains uppercase letters
set wrapscan                      " Search again from top when reached the bottom
set nohlsearch                    " Don't highlight after search
set incsearch                     " incremental searching
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Persistent undo settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/undo//
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
set listchars=tab:?\ ,eol:¬,extends:?,precedes:?,trail:·,nbsp:·
"set showbreak=?
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Spelling settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us               " Set language to US English
set nospell                       " Disable checking by default (use <F4> to toggle)
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Omni completion settings {{{
" ---------------------------------------------------------------------------------------------------------------------
" set completeopt-=preview          " Don't show preview scratch buffers
" set wildignore=*.o,*.obj,*~
" " set wildignore+=*.png,*.jpg,*.jpeg
" set wildignore+=*vim/backups*
" set wildignore+=*sass-cache*
" set wildignore+=*DS_Store*
" set wildignore+=*.gem
" set wildignore+=tmp/**
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Neovim specific configuration {{{
" ======================================================================================================================
if has("nvim")

  let test#strategy = "neoterm"
  " ======================================================================================================================
  " Neoterm
  " ======================================================================================================================
  let g:neoterm_position = 'horizontal'
  let g:neoterm_automap_keys = ',tt'
  let g:neoterm_size = '10'
  let g:neoterm_keep_term_open = 1
  "let g:neoterm_run_tests_bg = 1
  "let g:neoterm_raise_when_tests_fail = 1
  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  :tnoremap <Esc> <C-\><C-n>
  " optional: make it easier to switch between terminal splits
  " ctrl doesn't work for some reason so I use alt
  " I think the terminal is capturing ctrl and not bubbling to vim or something
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  " run set test lib
  " nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
  " nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
  " nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
  " nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>
  " Useful maps
  " hide/close terminal
  nnoremap <silent> ,th :call neoterm#close()<cr>
  " clear terminal
  nnoremap <silent> ,tl :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> ,tc :call neoterm#kill()<cr>
  " Rails commands
  command! Troutes :T rake routes
  command! -nargs=+ Troute :T rake routes | grep <args>
  command! Tmigrate :T rake db:migrate
  " Git commands
  command! -nargs=+ Tg :T git <args>
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Core key bindings-Remappings {{{
" ======================================================================================================================

" Save file
nnoremap <Leader>s :w<CR>

" Quiting and saving all
cnoremap ww wqall
" Quiting and not saving all
cnoremap qq qall
cnoremap <ESC><ESC> qall!<CR>


" Quicker window movement
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
" up and down have been  mapped to tmux window navigation
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" Intelligent windows resizing using ctrl + arrow keys
" Easier for Poker 3.
nnoremap <silent> <Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

" nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
" nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
" nnoremap <silent> <C-Up> :resize +1<CR>
" nnoremap <silent> <C-Down> :resize -1<CR>

nnoremap <silent> ,r zR

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Toggle between normal and relative numbering.
nnoremap <leader>\ :call utils#NumberToggle()<cr>

" Buffers navigation and management
nnoremap <leader>] :bn<CR>
nnoremap <leader>[  :bp<CR>
"Close buffer workaround
map <C-x> :bn<cr>:bd #<cr>:bp<cr>

"Close all buffers
"map <C-c> :bufdo bd<cr>

"Delete Current File
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR>

" Quickly open a vertical split of my init.vim and source my init.vim
nnoremap <silent> <leader>ev :vs ~/.config/nvim/init.vim<CR>
" Reload init.vim
"nnoremap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>

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

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Fix the cw at the end of line bug default Vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Quick-fix window navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" CTags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap ,ts :ts<CR>
"nnoremap ,tg :GenerateTags<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z
" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap <leader>c mzi<CR><ESC>`z


" Start substitute,replace on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" Faster sort
vnoremap ,s :!sort<CR>

" Easier fold toggling
" Toggle
nnoremap <silent> ,n za
" Close all
nnoremap <silent> ,m zM
" Open  all
nnoremap <silent> ,r zR

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

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge


" vim-test mappings
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>. :TestLast<CR>
"map <silent> <leader>g :TestVisit<CR>

" allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call utils#ExecuteMacroOverVisualRange()<CR>

"" Turn off recording
map q <Nop>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" Split line (opposite of J)
nnoremap <CR> i<CR><Esc>

"}}}

" -----------------------------------------------------
" vim-tmux-navigator {{{
" -----------------------------------------------------
"" also see settings in tmux.conf Alternatives for next/previous windows.
"" tmux left right window navigation

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-k> :TmuxNavigateRight<cr>

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
            \ { 'c': '~/dotfiles/neovim/init.vim' },
            \ { 'd': '~/dotfiles/neovim/plugins.vim'},
            \ { 'e': '~/dotfiles/neovim/autoload/utils.vim'},
            \ { 'f': '~/dotfiles/zsh/zshrc'},
            \ { 'g': '~/dotfiles/zsh/zshenv'},
            \ { 'h': '~/dotfiles/zsh/zsh_aliases'},
            \ { 'i': '~/dotfiles/install.conf.yaml'}
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


" let g:sk = ['Spiros Kabasakalis NeoVim']                                                                                                         ]

" let g:startify_custom_header = g:sk

let g:startify_custom_header = [' ',' ', '   Spiros Kabasakalis', '   Custom NeoVim Setup']


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

autocmd filetype nerdtree syn match haskell_icon #?# containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syn match html_icon #?# containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match go_icon #?# containedin=NERDTreeFile

" nnoremap <silent> <Leader>h :call utils#nerdWrapper()<CR>
nnoremap <silent> <Leader>h :NERDTreeToggle<CR>

" map <Leader>n :NERDTreeToggle<CR>

"}}}


"  -------------------------------------------
"  w0rp/ale, Asynchronous maker and linter {{{
" https://github.com/w0rp/ale/blob/master/doc/ale.txt
" ----------------------------------------------------
let g:ale_enabled = 1
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

" let g:ale_completion_enabled = 0
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
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
" Overwins disabled due to buggy cursor, still works though.
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `m{char}{label}`
" nmap m <Plug>(easymotion-overwin-f)
" or
" `m{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

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
"set signcolumn=yes

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
" Completion  roxma/nvim-completion-manager {{{
" -----------------------------------------------------
let g:cm_smart_enable=1  "disable ncm
let g:cm_auto_popup = 0 "disable automatic popup

"manually trigger autocompletion
imap <silent> <Tab> <Plug>(cm_force_refresh)
" imap <silent> <Tab> <c-r>=ManualCompletionTab()<cr>

" Next two lines make it possible to expand a snippet (See Ultisnips config) from the pop up menu using ENTER

" imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
" imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-t>":"\<CR>")

imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-t>":"")



" override builtin completions
" let g:cm_sources_enable = 0
" let g:cm_sources_override = {
" \ 'cm-tags': {'enable':0}
" \ }
"
" increase for fast typing performance
" let g:cm_complete_start_delay = 0
" increase to minimize flickering of pop up menu
" let g:cm_complete_popup_delay = 50

"}}}
"

" -----------------------------------------------------
" Deoplete autocomplete {{{
" -----------------------------------------------------
let g:deoplete#enable_at_startup = 0 "stupid deoplete is super buggy, lags like crazy in INSERT MODE. Stupid Jap.
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1

" g:deoplete#disable_auto_complete = 1

set completeopt+=noinsert
set completeopt-=preview

let g:deoplete#omni#input_patterns={}
let g:deoplete#sources={}

" let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
" let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
" let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
" let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']

" Insert <TAB> or select next match inoremap <silent> <expr> <Tab> utils#tabComplete() Manually trigger tag autocomplete
" inoremap <silent> <expr> <C-]> utils#manualTagComplete()
" " <C-h>, <BS>: close popup and delete backword char
" inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
" Set async completion.
" set omnifunc=syntaxcomplete#Complete

"ruby complete -------------------------------------------------------------
" au FileType ruby setl omnifunc=monster#omnifunc
" autocmd FileType ruby set omnifunc=monster#omnifunc
let g:deoplete#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

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
set runtimepath+=~/.vimsnippets
" the following directories reside in .vimsnippets,
" note that there's also a snipmate folder which is not compatible with
" ultisnips, but some snippets work if a suffix is added with a  missing endsnippet.
" you have to manually do that and move them to the folders below.
let g:UltiSnipsSnippetDirectories=[ "ultisnips", "custom" ]
"user defined snippets
let g:UltiSnipsSnippetsDir= "~/.vimsnippets/custom"
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


" -----------------------------------------------------
" Localvimrc per project type configuration {{{
" -----------------------------------------------------
let g:localvimrc_name=[ ".cpp_init.vim" ]

"}}}

" -----------------------------------------------------
" Vim Markdown settings {{{
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
"}}}


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
nnoremap <silent> <F2> :so ~/.config/nvim/init.vim<CR>

"F3 NeoTerm Toggle
nnoremap <silent> <F3> :Ttoggle<cr>

"F4 Toggle white characters visibility
nnoremap <silent> <F4> :set list!<CR> :set list?<CR>

"F12 Show F keys toggles
nnoremap <F12> :call utils#showToggles()<CR>
