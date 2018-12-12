" ----------------------------------------------------------------------------------------------------------------------
" Nerdtree Config 
" ----------------------------------------------------------------------------------------------------------------------

call SpaceVim#logger#info('** Nerdtree custom configuration loaded from plugin/nerdtree.vim  **')

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

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
"
autocmd filetype nerdtree syn match go_icon #?# containedin=NERDTreeFile

let g:guiBgColor = "NONE"

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', guiBgColor )
call NERDTreeHighlightFile('haml', 'green', 'none', 'green', guiBgColor)
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', guiBgColor)
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', guiBgColor)
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', guiBgColor)
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', guiBgColor)
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', guiBgColor)
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow',guiBgColor) 
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', guiBgColor)
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', guiBgColor)
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', guiBgColor)
call NERDTreeHighlightFile('cpp', 'cyan', 'none', 'cyan', guiBgColor)
call NERDTreeHighlightFile('h', 'Gray', 'none', '#9999ff', guiBgColor)
call NERDTreeHighlightFile('scss', 'cyan', 'none', 'cyan', guiBgColor)
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', guiBgColor)
call NERDTreeHighlightFile('rb', 'Cyan', 'none', 'red', guiBgColor)
call NERDTreeHighlightFile('png', 'Cyan', 'none', 'red', guiBgColor)
call NERDTreeHighlightFile('jpg', 'Cyan', 'none', 'red', guiBgColor)
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', guiBgColor)
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', guiBgColor)
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', guiBgColor)
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', guiBgColor)
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', guiBgColor)
call NERDTreeHighlightFile('zshrc', 'Gray', 'none', '#686868', guiBgColor)
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', guiBgColor)
