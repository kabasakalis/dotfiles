" ======================================================================================================================
" Startify 
" ======================================================================================================================

call SpaceVim#logger#info('** Startify custom configuration loaded from plugin/startify.vim  **')

"autocmd User Startified setlocal cursorline
autocmd User Startified setlocal buftype=
" let g:startify_disable_at_vimenter    = 0
let g:startify_enable_special         = 0
let g:startify_files_number           = 10
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 0
let g:startify_change_to_vcs_root     = 0
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let NERDTreeHijackNetrw = 0

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent']            }, { 'type': 'dir',       'header': ['   Recent in '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" let g:startify_custom_indices = ['1', '2', '3']
let g:startify_bookmarks = [
            \ { '21': '~/dotfiles/spacevim/init.toml'},
            \ { '22': '~/dotfiles/spacevim/autoload/config_before.vim'},
            \ { '23': '~/dotfiles/spacevim/autoload/config_after.vim'},
            \ { '24': '~/dotfiles/spacevim/plugin/settings.vim'},
            \ { '25': '~/dotfiles/spacevim/plugin/coc.vim'},
            \ { '25': '~/dotfiles/neovim/init.vim' },
            \ { '26': '~/dotfiles/neovim/plugins.vim'},
            \ { '27': '~/dotfiles/neovim/autoload/utils.vim'},
            \ { '28': '~/dotfiles/zsh/zshrc'},
            \ { '29': '~/dotfiles/zsh/zshenv'},
            \ { '30': '~/dotfiles/zsh/zsh_aliases'},
            \ { '31': '~/dotfiles/install.conf.yaml'},
            \ { '32': '~/Documents/scratch.txt'}
            \ ]

let g:startify_commands = [
    \ ['Vim Reference', 'h ref'],
    \ ['Spacevim Configuration', 'h Spacevim-config']
    \ ]


let g:startify_custom_footer =
      \ ['', "   Neither the past, the present nor the future mind can be found", '']

"
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]

