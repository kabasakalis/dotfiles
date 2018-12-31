" ----------------------------------------------------------------------------------------------------------------------
" Language Server Protocol mappings with coc.vim client
" ======================================================================================================================

" let g:coc_filetype_map = {
				" \ 'html.swig': 'html',
				" \ 'wxss': 'css',
				" \ }


  "Path to node executable to start coc service. ex: >
	" let g:coc_node_path = '/usr/local/opt/node@10/bin/node'



" Rename symbol
nnoremap <silent> ,,re :call CocAction('rename')<cr>
" With clang-rename plugin
" nmap <buffer><silent> ,,re :<Plug>(clang_rename-current)
" au FileType c,cpp nmap <buffer><silent>,re <Plug>(clang_rename-current)

" Go to definition
nmap <silent> ,,gd <Plug>(coc-definition)
 
"  References
nmap <silent> ,,rf <Plug>(coc-references)

"  Do Hover
nn <silent> ,,do :call CocActionAsync('doHover')<cr>

nmap <silent> ,,td <Plug>(coc-type-definition)<cr>

nmap <silent> ,,gi <Plug>(coc-implementation)


nnoremap <silent> ,,co :call CocActionAsync('runCommand',
						\ 'java.workspace.compile')<cr>


nnoremap <silent> ,,pu :call CocActionAsync('runCommand',
						\ 'java.projectConfiguration.update')<cr>


nnoremap <silent> ,,ol :call CocActionAsync('runCommand',
						\ 'java.open.serverLog')<cr>


nnoremap <silent> ,,ok :call CocActionAsync('runCommand',
						\ 'java.edit.organizeImports')<cr>

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')


" Remap for format selected region
vmap ,,fo  <Plug>(coc-format-selected)<cr>
nmap ,,fo  <Plug>(coc-format-selected)<cr>


" Shortcuts for denite interface
" ======================================================================================================================

"Show symbols of current buffer
nnoremap <silent> ,,bs :<C-u>Denite coc-symbols<cr>

"Show symbols of current workspace
nnoremap <silent>  ,,ws  :<C-u>Denite coc-workspace<cr>

"Show diagnostics of current workspace 
nnoremap <silent> ,,dd  :<C-u>Denite coc-diagnostic<cr>

"Show available commands
nnoremap <silent> ,,sc  :<C-u>Denite coc-command<cr>

"Show available services
nnoremap <silent>  ,,ss  :<C-u>Denite coc-service<cr>

"Show links of current buffer
nnoremap <silent> ,,sl  :<C-u>Denite coc-link<cr>
