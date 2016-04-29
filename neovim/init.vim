" ######################################################################################################################
" ### Author : Spiros Kabasakalis <Kabasakalis@gmail.com>                                                            ###
" ######################################################################################################################
" ### Neovim Configuration focused on Web development                                                                ###
" ### Neovimmer since : Thu Apr 14 2016                                                                              ###                                                                             ###
" ######################################################################################################################

" ======================================================================================================================
" Plugin manager (Plug) settings
" ======================================================================================================================
"{{{

"""""""""""""""""""""""""""""
" Standard Set Up           "
"""""""""""""""""""""""""""""
"set encoding=utf8
set nocompatible   " choose no compatibility with legacy vi
set hidden
"set guifont=Literation\ Mono\ Powerline\ Nerd\ Font\ Complete 12

set runtimepath+=~/

" LEADER
let mapleader=" "

" THEME & LAYOUT
"jellybeans
"lucid
"railscasts
"Tomorrow-Night
"tropikos

" Color scheme based on time {{{
if strftime("%H") < 15
  let g:rehash256=1
  colorscheme Tomorrow-Night
  "transparency
  hi Normal  ctermfg=252 ctermbg=none
else
  let g:rehash256=1
  colorscheme tropikos
  "transparency
  hi Normal  ctermfg=252 ctermbg=none
endif
"}}}

" Highlight VCS conflict markers {{{
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}

" Highlight term cursor differently {{{
highlight TermCursor ctermfg=green guifg=green
"}}}

" Listchars highlighting {{{
highlight NonText ctermfg=235 guifg=gray
highlight SpecialKey ctermfg=235 guifg=gray
"}}}

" Remove underline in folded lines {{{
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
"}}}

" Link highlight groups to improve buftabline colors {{{
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment



" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  " Turn syntax highlighting on
  syntax on
  " start highlighting from 256 lines backwards
  syntax sync minlines=256
endif
"set lines=35 columns=150
" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=+1
" Numbers
" Display relative line numbers
"set relativenumber
set number
set numberwidth=2
let g:gitgutter_sign_column_always=1

" Screen scrolls 5 lines in front of the cursor
set scrolloff=5
set sidescrolloff=3


set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    "New buffers will be loaded without creating a swapfile  http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=1000
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set cursorline
set clipboard+=unnamed   " Allow to use system clipboard
set showmatch     " Show matching brackets when text indicator is over them
set matchtime=2   " How many tenths of a second to blink when matching brackets
set nostartofline  " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block  " To be able to select past EOL in visual block mode
set updatetime=1000   " Update time used to create swap file or other things
set nojoinspaces    " No extra space when joining a line which ends with . ? !

" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10

"" Searching
set hlsearch                    " highlight matches
"set nohlsearch                  "Disable search highlight
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set wrapscan                    " Search again from top when reached the bottom
set smartcase                   " ... unless they contain at least one capital letter
" turn on the wildmenu cuz everyone says to
set wildmenu
" have vim re-load files when they're changed outside of vim
set autoread
" Delete comment character when joining commented lines
set formatoptions+=j
" folding
" set foldenable
" set foldlevelstart=10
" set foldnestmax=10
" set foldmethod=indent

" neovim config
if has("nvim")
  " change cursor to bar in insert mode
  "let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " disable mouse support, what am I a vimposer?
  set mouse-=a

  " run tests with :T
  let test#strategy = "neoterm"

  "neoterm
  let g:neoterm_position = 'horizontal'
  let g:neoterm_automap_keys = ',tt'
  let g:neoterm_size = '10'
  let g:neoterm_keep_term_open = 1
  "let g:neoterm_run_tests_bg = 1
  "let g:neoterm_raise_when_tests_fail = 1

  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  "tnoremap <Esc> <C-\><C-n>
  :tnoremap <Esc> <C-\><C-n>

  " optional: make it easier to switch between terminal splits
  " ctrl doesn't work for some reason so I use alt
  " I think the terminal is capturing ctrl and not bubbling to vim or something
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  " totally optional: mirror the alt split switching in non-terminal splits
  " Quicker window movement
  nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l




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


"Plugins managed with vim-plug
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif


" FILE TYPES
"filetype on
filetype plugin indent on

filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins



" TEXT FORMATTING
filetype indent on
"set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
" And when Vim does wrap lines, have it break the lines on spaces and punctuation only (http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
set linebreak





" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" Pretty sure you need to mkdir backup, swap, and undo first to make this work
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

" show commands as you type them
set sc

" make vim a little speedier
set lazyredraw
set ttyfast


" Display extra whitespace
"set list " Show listchars by default
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
"set showbreak=↪

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"CtrlP Config

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Easy bindings for  its various modes
" nmap <leader>bb :CtrlPer<cr>
" nmap <leader>bm :CtrlPMixed<cr>
" nmap <leader>bs :CtrlPMRU<cr>

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>





"" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=50
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

" " NERDTress File highlighting
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
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('zshrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" NERDTress File highlighting only the glyph/icon
" test highlight just the glyph (icons) in nerdtree:
" autocmd filetype nerdtree highlight rb_icon ctermbg=none ctermfg=Red guifg=#ffa500
" autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
" autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500

autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFile


let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>j :NERDTreeFind<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>


" Disable arrows for navigation
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>




" vim-test mappings
map <silent> <leader>f :TestFile<CR>
map <silent> <leader>T :TestSuite<CR>
map <silent> <leader>t :TestNearest<CR>
map <silent> <leader>r :TestLast<CR>
map <silent> <leader>g :TestVisit<CR>

" nnoremap <silent> <Leader>t :TestFile<CR>
" nnoremap <silent> <Leader>s :TestNearest<CR>
" nnoremap <silent> <Leader>l :TestLast<CR>
" nnoremap <silent> <Leader>a :TestSuite<CR>
" nnoremap <silent> <leader>gt :TestVisit<CR>



" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright




" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quicker window movement
" nnoremap <Down> <C-w>j
" nnoremap <Up> <C-w>k
" nnoremap <Left> <C-w>h
" nnoremap <Right> <C-w>l

"Easy Window Resizing
" nnoremap <Space><Up> <C-w>5+
" nnoremap <Space><Down> <C-w>5-
" nnoremap <Space><Left> <C-w>5>
" nnoremap <Space><Right> <C-w>5<

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>



" Buffers navigation and management
nnoremap <leader>] :bn<CR>
nnoremap <silent>[  :bp<CR>

"Close buffer workaround
map <C-x> :bn<cr>:bd #<cr>:bp<cr>
" Show all open ers and their status
" map <Leader><Left> :bprev<CR>
" map <Leader><Right> :bnext<CR>


" -----------------------------------------------------
" Neomake settings {{{
" -----------------------------------------------------
let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'rubyConstant',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'Identifier',
      \ }
"}}}
let g:neomake_javascript_enabled_makers = ['mri','rubocop','reek']
let g:neomake_ruby_mri_buffer_output = 1
"let g:neomake_ruby_rubocop_maker = { 'args': ['-c.rubocop.yml', '-n'], 'cwd': getcwd() }


" -----------------------------------------------------
" 7.1 Run linters after save {{{
" -----------------------------------------------------

" npm install -g eslint
"autocmd BufWritePost *.js Neomake eslint
" npm install -g jsonlint
autocmd BufWritePost *.json Neomake jsonlint
" npm install -g typescript
autocmd BufWritePost *.ts Neomake tsc
" gem install rubocop
autocmd BufWritePost *.rb Neomake rubocop
" ruby
autocmd BufWritePost *.rb Neomake mri
" sudo apt-get install elixir
autocmd BufWritePost *.ex Neomake elixir
" apt-get install tidy
autocmd BufWritePost *.html Neomake tidy
" gem install haml_lint
autocmd BufWritePost *.haml Neomake hamllint
" gem install scsslint
autocmd BufWritePost *.scss Neomake scsslint
" gem install mdl
autocmd BufWritePost *.md Neomake mdl
" apt-get install shellcheck
autocmd BufWritePost *.sh Neomake shellcheck
" pip3 install vim-vint
autocmd BufWritePost *.vim Neomake vint
"}}}


" configure syntastic syntax checking to check on open as well as save
" let g:syntastic_check_on_open=1
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" let g:syntastic_eruby_ruby_quiet_messages =
"     \ {"regex": "possibly useless use of a variable in void context"}
" Syntastic settings
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_ruby_checkers = ['mri', 'rubocop']






" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical


" https://github.com/justinmk/vim-sneak
" Map Sneak_s using nmap-- not nnoremap. That seems to cause problems
"nmap <Tab> <Plug>Sneak_s
"nmap <S-Tab> <Plug>Sneak_S
"vmap <Tab> <Plug>Sneak_s
"vmap <S-Tab> <Plug>Sneak_S

" vim-move C used for window nav right now
"let g:move_key_modifier = 'C'

" -----------------------------------------------------
" 4.5 Gitgutter settings {{{
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'



"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
" Enable the list of ers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_exclude_preview = 1




" Dev Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

"Ctrl-spc
nnoremap <silent><C-p> :CtrlSpace O<CR>


"ctrlspace
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
let g:CtrlSpaceUseTabline = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:ctrlspace_max_files = 100
let g:ctrlspace_max_search_results = 100
let g:ctrlspace_use_ruby_bindings = 1
set wildignore=*.png,*.jpg,*.jpeg


" vim-pasta Pasting in Vim with indentation adjusted to destination context.
let g:pasta_paste_before_mapping = ',O'
let g:pasta_paste_after_mapping = ',o'

"YouCompleteMe
"let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
"autocmd FileType ruby,eruby let g:rubycomplete_er_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"supertab
"let g:SuperTabDefaultCompletionType = "context"

" -----------------------------------------------------
" 5.8 Deoplete autocomplete {{{
" -----------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length=2
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}
let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
"inoremap <expr><C-@> deoplete#mappings#manual_complete()
" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> utils#manualTagComplete()
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"




" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby set omnifunc=monster#omnifunc
"set omnifunc=monster#omnifunc
"let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
"let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*\|\h\w*::']

" Set the tag file search order
set tags=./tags;


"""""""""""""""""""""""""""""""""
" Re-Mappings                "
"""""""""""""""""""""""""""""""""
" Quickly open a vertical split of my VIMRC and source my VIMRC
nnoremap <silent> <leader>ev :vs ~/.config/nvim/init.vim<CR>
" RELOAD init.vim
nnoremap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>



" Save file
  nnoremap <Leader>w :w<CR>

" H to beginning of line, L to the end
noremap H ^
noremap L $
noremap <c-a> ^
noremap <c-e> $

" J and K move up and down 10 lines
" noremap J 5j
" noremap K 5k

" D deletes to the end of the line, and Y yanks to end of line
nnoremap D d$
nnoremap Y y$


" place whole file on the system clipboard (and return cursor to where it was)
nmap <Leader>a maggVG"*y`a

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


" Start substitute on current word under the cursor
nnoremap ,s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap ,/ /<CR>

" Start reverse search on current word under the cursor
nnoremap ,? ?<CR>

" Faster sort
vnoremap ,s :!sort<CR>
"}}}

" Easier fold toggling
nnoremap <leader>z za

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall



" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Enter gives a new line when in command mode without entering insert mode. Likewise, shift+enter gives a new line
" above the cursor
"nmap <CR> o<Esc>
nnoremap <S-Enter> o<Esc>

" j and k don't skip over wrapped lines in following FileTypes, unless given a
" count (helpful since I display relative line numbers in these file types)
" (https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/cliuz1o)
autocmd FileType ruby nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType ruby nnoremap <expr> k v:count ? 'k' : 'gk'

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz


"Smooth scroll vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

"" Turn off recording
map q <Nop>

" -----------------------------------------------------
" 5.9 CtrlSF {{{
" -----------------------------------------------------
nnoremap <leader>gg :CtrlSF<Space>
nnoremap <leader>gG :CtrlSFToggle<Space>
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
let g:ctrlsf_auto_close = 0
let g:ctrlsf_case_sensitive = 'no'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_confirm_save = 1
let g:ctrlsf_ignore_dir = ['bower_components', 'npm_modules']
let g:ctrlsf_selected_line_hl = 'op'
"let g:ctrlsf_context = '-C 3'
nnoremap <silent> ,g :call utils#searchCurrentWordWithAg()<CR>
"}}}


" -----------------------------------------------------
" 5.10 Vim-Plug {{{
" -----------------------------------------------------
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>




" allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


" Open terminals tab
function! TermTab()
  tabnew
  :Tpos 'vertical'
  :Tnew
  :call neoterm#do('bundle exec rails c')
  :Tnew
  :call neoterm#do('bundle exec rails server')
  :quit
  tabp
endfunction
command! -register TermTab call TermTab()

" Workspace Setup
" ----------------
function! DefaultWorkspace()
    let numcol = 2
    vnew
    vnew
    e Gemfile
    :1quit
    :TermTab
    let g:neoterm_position='horizontal'
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunction
" Toggle between normal and relative numbering.
nnoremap <leader>\ :call NumberToggle()<cr>


" neosnippet.
" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.config/nvim/'
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)


"Ultisnips for snippets
" Disable built-in <C-x><C-k> to be able to go backward
inoremap <C-x><C-k> <NOP>
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-k>'
let g:UltiSnipsJumpBackwardTrigger='<C-j>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", ".vimsnippets"]
"user defined snippets
let g:UltiSnipsSnippetsDir= "~/.vimsnippets"
let g:UltiSnipsUsePythonVersion=3

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" -----------------------------------------------------
" 4.10 Clever F settings {{{
" -----------------------------------------------------
let g:clever_f_across_no_line=1
let g:clever_f_smart_case=1
let g:clever_f_show_prompt=1
let g:clever_f_chars_match_any_signs=';'


" -----------------------------------------------------
" 4.11 Vim Markdown settings {{{
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1


" 4.13 Quick scope settings {{{
" -----------------------------------------------------
"let g:qs_highlight_on_keys=['f', 'F', 't', 'T']

" -----------------------------------------------------
" 4.15 Ctrl-SF settings {{{
" -----------------------------------------------------
let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=1
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=1


" -----------------------------------------------------
" 3.8 Custom commands and functions {{{
" -----------------------------------------------------

" Generate tags definitions gem install --no-user-install starscope
command! GenerateTags :call utils#generateCtags()

" Reformat whole or selection from file
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


" ======================================================================================================================
" 7.0 Autocommands
" ======================================================================================================================
"{{{

" Turn spellcheck on for markdown files {{{
autocmd BufNewFile,BufRead *.md setlocal spell
"}}}

" Remove trailing whitespaces automatically before save {{{
autocmd BufWritePre * call utils#stripTrailingWhitespaces()
"}}}

" Resize splits when the window is resized {{{
autocmd VimResized * :wincmd =
"}}}

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

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh. {{{
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
" -----------------------------------------------------

"F1 NERDTree wrapper
nnoremap <silent> <F1> :call utils#nerdWrapper()<CR>

"F2 Free

"F3 Paste mode toggling
nnoremap <silent> <F3> :set paste!<CR> :set paste?<CR>

"F4 Toggle spelling on and off
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>

"F5 Source (reload configuration)
if has("nvim")
  nnoremap <silent> <F5> :so ~/.config/nvim/init.vim<CR>
else
  nnoremap <silent> <F5> :source $MYNVIMRC<CR>
endif

"F6 Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>

"F7 Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
if has("nvim")  "neovim only
  "F8 NeoTerm Toggle
  nnoremap <silent> <F8> :Ttoggle<cr>
  " New horizontal term buffer

  "F9 Send line To NeoTerm
  nnoremap <silent> <F9> :TREPLSend<cr>

  "F10 Send File To NeoTErm
  nnoremap <silent> <F10> :TREPLSendFile<cr>
else  "vim
  "F8 Free
  "nnoremap <silent> <F8>
  "F9 Free
  "nnoremap <silent> <F9>
  "F10 Free
  "nnoremap <silent> <F10>
endif

"F11 Free

" Echo out toggles legend on <F12>
nnoremap <F12> :call utils#showToggles()<CR>
"}}}
