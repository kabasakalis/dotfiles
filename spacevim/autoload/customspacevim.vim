function! customspacevim#before() abort
call SpaceVim#logger#info('** Custom Spacevim settings loaded. **')
" ======================================================================================================================
" Core Vim settings, also used in Visual Studio  {{{
" ======================================================================================================================
" Leave SPACE in spacevim.
let g:mapleader = ';'
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set scrolloff=5                   " Screen scrolls 5 lines in front of the cursor
set backspace=2                   " Backspace deletes like most programs in insert mode
set history=1000
set laststatus=2                  " Always display the status line
set nostartofline                 " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block             " To be able to select past EOL in visual block mode
set nojoinspaces                  " No extra space when joining a line which ends with . ? !

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
" Core key bindings-Remappings {{{
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

" Quickly open a vertical split of my vimrc and source my vimrc
nnoremap  <leader>ev :vs c:\Users\spiros\_vimrc<CR>

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

" Keep the cursor in place while joining lines
nnoremap J mzJ`z
" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap <leader>c mzi<CR><ESC>`z

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

" Additional remappings of Space key bindings to leader mappings for less
" keystrokes

" ---------------------------------------------------------------------------------------------------------------------
" Additional remappings of Space key bindings to leader mappings for less {{{
" ======================================================================================================================

" Format
nmap  ff        <Space>bf
" Home screen
nmap  <leader>h <Space>bh
" Kill buffer
nmap <leader>c  <Space>bd
" Next buffer
nmap <leader>n  <Space>bn


"}}}
endfunction

let s:HI = SpaceVim#api#import('vim#highlight')

function! s:cursor_highlight() abort
    echo s:HI.syntax_at()
endfunction

function! s:defx_my_settings() abort
    " Define mappings
endfunction

