" Spiros Kabasakalis NeoVim Configuration

"""""""""""""""""""""""""""""
" Standard Set Up           "
"""""""""""""""""""""""""""""
"set encoding=utf8
set nocompatible   " choose no compatibility with legacy vi
set hidden
"set guifont=Literation\ Mono\ Powerline\ Nerd\ Font\ Complete 12

" LEADER
let mapleader=" "

" THEME & LAYOUT
colorscheme Tomorrow-Night
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
set textwidth=80
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
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=1000
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set cursorline


"" Searching
set hlsearch                    " highlight matches
"set nohlsearch                  "Disable search highlight
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
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
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l


  nnoremap <silent> <f10> :TREPLSendFile<cr>
  nnoremap <silent> <f9> :TREPLSend<cr>
  vnoremap <silent> <f9> :TREPLSend<cr>

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



  " terminal toggle
  tnoremap <F8> <C-\><C-n>
  set switchbuf+=useopen
  function! TermEnter()
    let bufcount = bufnr("$")
    let currbufnr = 1
    let nummatches = 0
    let firstmatchingbufnr = 0
    while currbufnr <= bufcount
      if(bufexists(currbufnr))
        let currbufname = bufname(currbufnr)
        if(match(currbufname, "term://") > -1)
          echo currbufnr . ": ". bufname(currbufnr)
          let nummatches += 1
          let firstmatchingbufnr = currbufnr
          break
        endif
      endif
      let currbufnr = currbufnr + 1
    endwhile
    if(nummatches >= 1)
      execute ":terminal ". firstmatchingbufnr
      startinsert
    else
      execute ":terminal"
    endif
  endfunction
  map <F12> :call TermEnter()<CR>



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
"autocmd BufWritePre * :%s/\s\+$//e " Remove whitespaces on save

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
set list listchars=tab:»·,trail:·,nbsp:·

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

" Tab completionF
" will insert tab at beginning of line,
" will use completion if not at beginning
"set wildmode=list:longest,list:full
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <S-Tab> <c-n>


let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>j :NERDTreeFind<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :NERDTreeFocus<CR>


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
nnoremap <Space><Up> <C-w>5+
nnoremap <Space><Down> <C-w>5-
nnoremap <Space><Left> <C-w>5>
nnoremap <Space><Right> <C-w>5<

" Move to the next buffeer
nmap <C-Right> :bnext<CR>
" Move to the previous er
nmap <C-Left> :bprevious<CR>
"Close er workaround
map <C-x> :bn<cr>:bd! #<cr>:bp<cr>
" Show all open ers and their status
" map <Leader><Left> :bprev<CR>
" map <Leader><Right> :bnext<CR>





" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}


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


"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
" Enable the list of ers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'




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

"YouCompleteMe
"let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
"autocmd FileType ruby,eruby let g:rubycomplete_er_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"supertab
"let g:SuperTabDefaultCompletionType = "context"

"Completion Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}
inoremap <expr><C-@> deoplete#mappings#manual_complete()
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
noremap J 10j
noremap K 10k

" D deletes to the end of the line, and Y yanks to end of line
nnoremap D d$
nnoremap Y y$

" use leader to interact with the system clipboard
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P

nnoremap <Leader>y ma^"*y$`a
nnoremap <Leader>c ^"*c$
nnoremap <Leader>d ^"*d$

vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d

" place whole file on the system clipboard (and return cursor to where it was)
nmap <Leader>a maggVG"*y`a

" have x (removes single character) not go into the default registry
nnoremap x "_x
" Make X an operator that removes without placing text in the default registry
nmap X "_d
nmap XX "_dd
vmap X "_d
vmap x "_d

" when changing text, don't put the replaced text into the default registry
nnoremap c "_c
vnoremap c "_c


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

"Smooth scroll vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

"" Turn off recording
map q <Nop>


" allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction



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
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
