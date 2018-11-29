" Informative echo line
function! g:utils#showToggles() abort
  echom '<F1> NOT WORKING | <F2> Reload rc | <F3> NeoTerm Toggle | <F4> Whitechars | <F5> Void | <F6> Void |' .
        \' <F7> Void | <F8> Void | <F9> Void | <F10> Void  | <F11> Void |' .
        \' <F12> This message'
endfunction

" Copy and paste function using xclip
function! g:utils#clipboardYank() abort
  call system('xclip -i -selection clipboard', @@)
endfunction

function! g:utils#clipboardPaste() abort
  let @@ = system('xclip -o -selection clipboard')
endfunction

" Profile neovim and save results to profile.log
function! g:utils#profile() abort
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
  echom 'Profiling started (will last until you quit neovim).'
endfunction

" When cycling ignore NERDTree and Tagbar
function! g:utils#intelligentCycling() abort
  " Cycle firstly
  wincmd w
  " Handle where you are now
  if &filetype ==# 'nerdtree'
    call g:utils#intelligentCycling()
  endif
  " If in terminal buffer start insert
  if &buftype ==# 'terminal'
    startinsert!
  endif
endfunction

" Be aware of whether you are right or left vertical split
" so you can use arrows more naturally.
" Inspired by https://github.com/ethagnawl.
function! g:utils#intelligentVerticalResize(direction) abort
  let l:window_resize_count = 5
  let l:current_window_is_last_window = (winnr() == winnr('$'))

  if (a:direction ==# 'left')
    let [l:modifier_1, l:modifier_2] = ['+', '-']
  else
    let [l:modifier_1, l:modifier_2] = ['-', '+']
  endif

  let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
  let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
  execute l:command
endfunction

" Run current file
function! g:utils#runCurrentFile() abort
  if &filetype ==? 'ruby'
    let l:command = 'ruby %'
  elseif &filetype ==? 'sh'
    let l:command = 'sh %'
  else
    echom "Can't run current file (unsupported filetype: " . &filetype . ')'
  endif

  if exists('command')
    execute ':terminal ' . l:command
  endif
endfunction

" Run NERDTreeFind or Toggle based on current buffer
function! g:utils#nerdWrapper() abort
  if &filetype ==# '' " Empty buffer
    :NERDTreeToggle
  elseif expand('%:t') =~? 'NERD_tree' " In NERD_tree buffer
    wincmd w
    :NERDTreeToggle
  else " Normal file buffer
    :NERDTreeFind
  endif
endfunction

" Strip trailing spaces
function! g:utils#stripTrailingWhitespaces() abort
  " Preparation: save last search, and cursor position.
  let l:lastSearch = @/
  let l:line = line('.')
  let l:col = col('.')

  " Do the business:
  execute '%s/\s\+$//e'

  " Clean up: restore previous search history, and cursor position
  let @/ = l:lastSearch
  call cursor(l:line, l:col)
endfunction

" Set SK keyboard layout with qwerty
function! g:utils#setSKKBLayout() abort
  silent !setxkbmap sk -variant qwerty
endfunction

" Set US keyboard layout with qwerty
function! g:utils#setUSKBLayout() abort
  silent !setxkbmap us
endfunction

" Generate ctags and put them into tags directory
" gem install starscope
function! g:utils#generateCtags() abort
  silent execute '!starscope -e ctags'
  echom 'Tags generated into tags file!'
endfunction

" Tab wrapper
function! g:utils#tabComplete() abort
  let l:col = col('.') - 1

  if pumvisible()
    return "\<C-n>"
  else
    if !l:col || getline('.')[l:col - 1] !~# '\k'
      return '\<TAB>'
      "return "<C-n>"
    else
      return "\<C-n>"
    endif
  endif
endfunction

" Manual Tag complete
" TODO: improve to also trigger tag complete after closing popup
function! g:utils#manualTagComplete() abort
  if pumvisible()
    return g:deoplete#mappings#close_popup()
  else
    return g:deoplete#mappings#manual_complete('tag')
  endif
endfunction

" Simple notes management
function! g:utils#openNotes() abort
  execute ':e ~/dev/notes/vim-notes.md'
endfunction

" Use omni complete source as default
function! g:utils#useOmniTabWrapper() abort
  inoremap <buffer> <expr> <TAB> utils#insertTabOmniWrapper()
endfunction

" Unite commands wrappers
function! g:utils#uniteSources() abort
  execute 'Unite -no-split -buffer-name=sources -start-insert source'
endfunction

function! g:utils#uniteMRUs() abort
  execute 'Unite -no-split -buffer-name=most-recently-used -start-insert neomru/file'
endfunction

function! g:utils#uniteFileBrowse() abort
  execute 'Unite -no-split -buffer-name=project-files -start-insert file'
endfunction

function! g:utils#uniteFileRec() abort
  execute 'Unite -no-split -buffer-name=file-recursive-search -start-insert file_rec/neovim'
endfunction

function! g:utils#uniteBuffers() abort
  execute 'Unite -no-split -buffer-name=buffers -start-insert buffer'
endfunction

function! g:utils#uniteOutline() abort
  execute 'Unite -no-split -buffer-name=symbols -start-insert outline'
endfunction

function! g:utils#uniteTags() abort
  execute 'Unite -no-split -buffer-name=tags -start-insert tag'
endfunction

function! g:utils#uniteHistory() abort
  execute 'Unite -no-split -buffer-name=edit-history change'
endfunction

function! g:utils#uniteLineSearch() abort
  execute 'Unite -no-split -buffer-name=line-search -start-insert line'
endfunction

function! g:utils#uniteYankHistory() abort
  execute 'Unite -no-split -buffer-name=yank-history history/yank'
endfunction

function! g:utils#uniteRegisters() abort
  execute 'Unite -no-split -buffer-name=registers register'
endfunction

function! g:utils#uniteWindows() abort
  execute 'Unite -no-split -buffer-name=splits window'
endfunction

function! g:utils#uniteSnippets() abort
  execute 'Unite -no-split -buffer-name=snippets -start-insert ultisnips'
endfunction

function! g:utils#uniteCustomMenu() abort
  execute 'Unite -no-split -buffer-name=menu -start-insert menu'
endfunction

function! g:utils#uniteJumps() abort
  execute 'Unite -no-split -buffer-name=jumps -start-insert jump'
endfunction

function! g:utils#uniteCommands() abort
  execute 'Unite -no-split -buffer-name=commands -start-insert command'
endfunction

function! g:utils#uniteMappings() abort
  execute 'Unite -no-split -buffer-name=mappings -start-insert mapping'
endfunction

" Format function
" Needs: npm install js-beautify, gem install ruby-beautify, python
function! g:utils#formatFile() abort
  let l:line = line('.')
  let l:col = col('.')
  let l:command_prefix = '%!'

  if &filetype ==? 'javascript.jsx'
    let l:command = 'js-beautify -X -f -'
  elseif &filetype ==? 'html'
    let l:command = 'html-beautify -f -'
  elseif &filetype ==? 'css'
    let l:command = 'css-beautify -f -'
  elseif &filetype ==? 'json'
    let l:command = 'python -m json.tool'
  elseif &filetype ==? 'ruby'
    let l:command = 'ruby-beautify -c 2 -s'
  else
    " Basic vim format fallback
    normal! gg=G
  endif

  if exists('l:command')
    execute l:command_prefix . l:command
  endif

  call cursor(l:line, l:col)
endfunction

" Annotate file function (only ruby support for now)
function! g:utils#annotateFile() abort
  let l:command_prefix = '%!'

  if &filetype ==? 'ruby'
    let l:command = 'seeing_is_believing -x'
  endif

  if exists('l:command')
    execute l:command_prefix . l:command
  endif
endfunction

" Mode function for Lightline statusline
function! g:utils#lightLineMode() abort
  let l:fname = expand('%:t')
  return l:fname =~? 'NERD_tree' ? 'NT' :
        \ &filetype ==? 'unite' ? 'Unite' :
        \ winwidth(0) > 70 ? g:lightline#mode() : ''
endfunction

" File format function for Lightline statusline
function! g:utils#lightLineFileformat() abort
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

" Filetype function for Lightline statusline
function! g:utils#lightLineFiletype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" File encoding function for Lightline statusline
function! g:utils#lightLineFileencoding() abort
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

" File name function for Lightline statusline
function! g:utils#lightLineFilename() abort
  let l:fname = expand('%:t')
  return l:fname =~? 'NERD_tree' ? 'NERDTree' :
        \ &filetype ==? 'unite' ? g:unite#get_status_string() :
        \ ('' !=# l:fname ? l:fname : '[No Name]')
endfunction

" Howdoi integration (pip install howdoi)
function! g:utils#howDoI() abort
  let l:command_prefix = 'read '
  let l:howdoi = '!howdoi '

  call inputsave()
  let l:query = input('How do I: ')
  call inputrestore()

  if l:query !=# ''
    execute l:command_prefix . l:howdoi . l:query
  endif
endfunction

" Search current word with CtrlSF
" Inspired by github.com/zenbro
function! g:utils#searchCurrentWordWithAg() abort
  execute 'CtrlSF' expand('<cword>')
endfunction

" Reset tabs to 4 spaces
function! g:utils#retabToFourSpaces() abort
  setlocal tabstop=4 shiftwidth=4 expandtab
  retab
endfunction

" Open terminals tab for rails
function! g:utils#RailsConsoles()
  tabnew
  :Tpos 'vertical'
  :Tnew
  :call neoterm#do('bundle exec rails c')
  :Tnew
  :call neoterm#do('bundle exec rails server')
  :quit
  tabp
endfunction

" Workspace Setup
function! g:utils#DefaultWorkspace()
    let numcol = 2
    vnew
    vnew
    e Gemfile
    :1quit
    :RailsConsoles
    let g:neoterm_position='horizontal'
endfunction

" Relative numbering toggle
function! g:utils#NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunction

" allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
function! g:utils#ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


" Completion  roxma/nvim-completion-manager
function! ManualCompletionTab()
	if pumvisible()
		return "\<C-n>"
	endif
	let l:ctx = cm#context()
	let l:typed = l:ctx['typed']
	let l:kw = matchstr(l:typed,'\v\S+$')
	if len(l:kw)
		return cm#_force_refresh()
	endif
	return "\<Tab>"
endfunction


