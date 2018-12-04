function! customspacevim#before() abort
call SpaceVim#logger#info('** Custom Spacevim settings loaded. **')
" ======================================================================================================================
" Core Vim settings, also used in Visual Studio  {{{
" ======================================================================================================================
"  Custom mapleader. Leave SPACE for  spacevim.
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

" Additional remappings of Space key bindings to leader mappings for less
" keystrokes

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

" Next buffer
nmap <leader>n  <Space>bn
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
nmap <leader>g  <Space>fD

" Easy Motion Word 
nmap <leader>j  <Space>fD

" Cycle theme 
nmap <leader>u  <Space>Tn

" Search symbols with ag
" ag must be installed and in the path 
nmap <leader>f  <Space>sa

" Transpose character, word or line. 
nmap <leader>x  <Space>xt







"}}}


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
let g:NERDTreeWinSize=50
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeMapActivateNode='<right>'
let g:NERDTreeWinPos = "left"




autocmd filetype nerdtree syn match haskell_icon #?# containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
" autocmd filetype nerdtree syn match html_icon #?# containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match go_icon #?# containedin=NERDTreeFile

" nnoremap <silent> <Leader>h :call utils#nerdWrapper()<CR>
" nnoremap <silent> <Leader>h :NERDTreeToggle<CR>

" map <Leader>n :NERDTreeToggle<CR>

"}}}

"Plugins managed with vim-plug {{{

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



endfunction

let s:HI = SpaceVim#api#import('vim#highlight')

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction



function! s:cursor_highlight() abort
    echo s:HI.syntax_at()
endfunction

function! s:defx_my_settings() abort
    " Define mappings
endfunction


