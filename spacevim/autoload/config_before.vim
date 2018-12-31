"=======================================================================================================================
" Spiros kabasakalis
" Custom bootstrap_before Configuration for SpaceVim
" This configuration is combined with init.toml
" Author: Spiros kabasakalis < kabasakalis at gmail.com >
" URL: https://github.com/kabasakalis
" Copyright (c) 2018 - 2019  Spiros Kabasakalis
" License: MIT
"=======================================================================================================================

function! config_before#before() abort
call SpaceVim#logger#info('** Custom Spacevim settings loaded from bootstrap_before (customspacevim) **')

" ======================================================================================================================
" Core Vim settings

" Python
if has("win32")
  " Windows Options
 let g:python3_host_prog = "F://Programs//Python//37//python.exe"
 let g:python2_host_prog = "F://Programs//Python//27//python.exe"
elseif has("unix")
  " Linux Options Neovim
  let g:python_host_prog  = "/home/spiros/.pyenv/versions/neovim2/bin/python"
  let g:python3_host_prog = "/home/spiros/.pyenv/versions/neovim3/bin/python"
else
endif

filetype indent on                " Enable filetype-specific indenting
filetype plugin on                " Enable filetype-specific plugins


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

" ----------------------------------------------------------------------------------------------------------------------
" Color and highlighting settings
" ======================================================================================================================
" enables menu but works only for GVim , not nvim-qt
set guioptions+=m
"
" Fixes NASTY CURSOR BUG for Neovim
set guicursor=
" Fixes NASTY CURSOR BUG for Spacevim
let g:spacevim_terminal_cursor_shape = 0

" Switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  " Turn syntax highlighting on
  syntax on
  " start highlighting from 256 lines backwards
  syntax sync minlines=256
endif

"Disable guicolors in basic mode, many terminal do not support 24bit  true colors
if has("gui_running")
 let g:spacevim_enable_guicolors = 1
else
" IMPORTANT: Keep this zero in terminator or suffer a NASTY bug with themes
 let g:spacevim_enable_guicolors = 1
 " IMPORTANT NOTE TO MY FUTURE SELF TO PREVENT MENTAL HEALTH ISSUES for non-graphical neovim
 " I don't have enough time to debug my own coding let alone fix this 
 " stupid shit. 
 " Some combination of g:spacevim_enable_guicolors and termguicolors
 " is required for a specific theme to work on a particular terminal.
 " Problem fixed after I upgraded Terminator, but it's wise to
 " have these comments here to protect my future sanity.
endif
if (has("termguicolors"))
  set termguicolors
endif

func! s:transparent_background()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
endf
" autocmd ColorScheme * call s:transparent_background()
" DESPACIO THEME
"DARKER GRAY
" let g:despacio_Sunset = 1
"DARKEST GRAY
" let g:despacio_Twilight = 1
"ALMOST BLACK
" let g:despacio_Midnight = 1

let g:rehash256=1

let g:spacevim_wildignore='*/tmp/*,*.so,*.swp,tags,*.jpg,*.ttf,*.TTF,*.png,*/target/*,.git,.svn,.hg,.DS_Store,*.svg'
"transparency
" hi Normal  ctermfg=252 ctermbg=none

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

" LineNumber Gutter 
" background color
highlight LineNr ctermfg=NONE ctermbg=NONE

" SignColumn (Git Gutter)
highlight SignColumn ctermfg=NONE ctermbg=NONE

" Link highlight groups to improve buftabline colors
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment

" Startify highlights
hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240


" ----------------------------------------------------------------------------------------------------------------------
" Search settings
" ----------------------------------------------------------------------------------------------------------------------
set ignorecase                    " Ignore case by default
set smartcase                     " Make search case sensitive only if it contains uppercase letters
set wrapscan                      " Search again from top when reached the bottom
set nohlsearch                    " Don't highlight after search
set incsearch                     " incremental searching

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Better help navigation with ENTER and BACKSPACE
:au filetype help :nnoremap <buffer><CR> <c-]>
:au filetype help :nnoremap <buffer><BS> <c-T>

" ----------------------------------------------------------------------------------------------------------------------
" Core key bindings-remappings
" ======================================================================================================================

" leader, leave SPACE for spacevim
let g:mapleader = ';'


" Quicker window movement
" up and down have been  mapped to tmux window navigation, not used in Windows.
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap ,r zR


" Buffers navigation and management, also ALT-<left> and ALT-<right>, see spacevim mappings
nnoremap <leader>] :bn<CR>
nnoremap <leader>[  :bp<CR>

"Close buffer workaround
map <C-x> :bn<cr>:bd #<cr>:bp<cr>

"Close all buffers, kind of dangerous
"map <C-c> :bufdo bd<cr>

" Quickly open a vertical split of my custom spacevim bootstrap_before settings.
nnoremap  <leader>eb :vs ~\dotfiles\spacevim\autoload\customspacevim.vim<CR>

" Quickly open a vertical split of my custom spacevim bootstrap_after settings.
nnoremap  <leader>ea :vs ~\dotfiles\spacevim\autoload\customspacevimafter.vim<CR>

" Quickly open a vertical split of my init.toml
nnoremap  <leader>ei :vs ~\dotfiles\spacevim\init.toml<CR>


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

" Copy Word
nmap ,w yiw

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

" ----------------------------------------------------------------------------------------------------------------------
" Early Spacevim configurations
" ======================================================================================================================
"
let g:spacevim_statusline_right_sections =
    \ [
    \ 'fileformat',
    \ 'cursorpos',
    \ 'percentage',
    \ 'time',
    \ 'date'
    \ ]

" ----------------------------------------------------------------------------------------------------------------------
" Additional core remappings of important Spacevim key bindings to leader mappings for less
" keystrokes. Also see customspacevimafter.vim for spacevim leader custom mappings.
" ======================================================================================================================
"Example for SPC group key binding
"call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
"call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)

"Example  for SPC key binding with existing group
"call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'echom "hello world"', 'test custom SPC', 1)


" Home screen
nmap  <leader>i <Space>bh

" Quiting and saving all
cnoremap ww wqall
" Quiting and not saving all
cnoremap qq qall


" Kill buffer
nmap <leader>k  <Space>bd

" Save buffer
nnoremap <leader>s :w<CR>

" Save all buffers
nmap <leader>S  <Space>fS

" Next Previous buffer
if has("win32")
" Windows
nmap <M-l>  <Space>bn
nmap <M-h>  <Space>bp
elseif has("unix")
" Unix
nmap <Right>  :bn<CR>
nmap <Left> :bp<CR>
  else
endif

" Swap buffer
nmap <leader>m  <Space>wM

" Comment lines or visual blocks
nmap <leader>c <Space>cl
vmap <leader>c <Space>cl

" Toggle File Tree
nmap <leader>h  <Space>ft

" Delete current buffer and file, confirmation, CAUTION.
nmap <leader>D  <Space>fD

" Edit Spacevim configuration
nmap <leader>g  <Space>fvd

" Easy Motion Word
nmap <leader>j  <Space>jw

" Cycle theme
nmap <leader>u  <Space>Tn

" Fuzzy find theme
nmap <leader>r  <Space>Ts

" Transpose character, word or line.
nmap <leader>x  <Space>xt

" Switch between the last two buffers
nnoremap <silent> [Window]s <c-^>

" Format
nmap  ff <Space>bf

" Content Search with FlyGrep on current buffer <SPC>ss
" Content Search with FlyGrep on current Project <SPC>sp
" Content Search with FlyGrep on current buffer directory <SPC>sd
" Use capitalized last key on above mappings for word under cursor.

" Content Search  with ag
" ag must be installed and in the path
nmap <leader>f  <Space>sa

" Content search with Denite and ag, open quick fix
map <leader>b :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>

" File search in current project with Denite
call SpaceVim#custom#SPC('nnoremap', ['f', 'p'], ':DeniteProjectDir file/rec<CR>', 'Find files in project (Denite) - *', 1)

" File search in current open buffers with Denite
call SpaceVim#custom#SPC('nnoremap', ['f', 'b'], ':Denite buffer<CR>', 'Find files in open buffers (Denite) - *', 1)


" ======================================================================================================================
" Plugin Settings early initialized need to be here. The rest are under plugin folder
" ======================================================================================================================

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




endfunction  "bootstrap_before ends here


"  ---------------------------------------------------------------------------------------------------------------------
" Definitions of functions that can be used inside the bootrstrap_before fuction body
" ----------------------------------------------------------------------------------------------------------------------
