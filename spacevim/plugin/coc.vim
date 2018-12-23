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

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')


" Remap for format selected region
vmap ,,fo  <Plug>(coc-format-selected)<cr>
nmap ,,fo  <Plug>(coc-format-selected)<cr>

" Semantic navigation. Roughly,
" D=> first child declaration L => previous declaration 'R' => next declaration 'U' => parent declaration
nn <silent> ,,jj :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
nn <silent> ,,hh :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
nn <silent> ,,ll :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
nn <silent> ,,kk :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>


" caller
nn <silent> ,,ca :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> ,,ce :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>


" $ccls/member
" member variables / variables in a namespace
nn <silent> ,,mv :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> ,,mf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> ,,nc :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nn <silent> ,,vv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> ,,v1 :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>


" bases
nn <silent> ,,bb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> ,,b3 :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent>  ,,dd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> ,d3 :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>


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
