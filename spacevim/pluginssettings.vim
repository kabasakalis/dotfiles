"Plugins managed with vim-plug {{{

" call SpaceVim#logger#info('** Custom Spacevim plugin settings loaded. **')
" -----------------------------------------------------
" Startify Config {{{
" -----------------------------------------------------
"autocmd User Startified setlocal cursorline
autocmd User Startified setlocal buftype=
" let g:startify_disable_at_vimenter    = 0
let g:startify_enable_special         = 0
let g:startify_files_number           = 10
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root     = 0
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'dir',       'header': ['   Recent in '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
" let g:startify_custom_indices

let g:startify_custom_indices = ['1', '2', '3']
let g:startify_bookmarks = [
            \ { '1': '~/dotfiles/neovim/init.vim' },
            \ { '2': '~/dotfiles/neovim/plugins.vim'},
            \ { '3': '~/dotfiles/neovim/autoload/utils.vim'},
            \ { '4': '~/dotfiles/zsh/zshrc'},
            \ { '5': '~/dotfiles/zsh/zshenv'},
            \ { '6': '~/dotfiles/zsh/zsh_aliases'},
            \ { '7': '~/dotfiles/install.conf.yaml'},
            \ { '8': '~/dotfiles/spacevim/init.toml'},
            \ { '9': '~/dotfiles/spacevim/autoload/customspacevim.vim'},
            \ { '10': '~/dotfiles/spacevim/autoload/customspacevim.vim'}
            \ ]

let g:startify_commands = [
    \ ['Vim Reference', 'h ref']
    \ ]


let g:startify_custom_header = [
        \ '   _____       _                 _  __     _                     _         _ _       ',
        \ '  / ____|     (_)               | |/ /    | |                   | |       | (_)     ',
        \ ' | (___  _ __  _ _ __ ___  ___  |   / __ _| |__   __ _ ___  __ _| | ____ _| |_ ___  ',
        \ '  \___ \|  _ \| |  __/ _ \/ __| |  < / _` | |_ \ / _` / __|/ _` | |/ / _` | | / __| ',
        \ '  ____) | |_) | | | | (_) \__ \ | . \ (_| | |_) | (_| \__ \ (_| |   < (_| | | \__ \ ',
        \ ' |_____/| .__/|_|_|  \___/|___/ |_|\_\__,_|_.__/ \__,_|___/\__,_|_|\_\__,_|_|_|___/ ',
        \ '        | |                                                                         ',
        \ '        |_|                                                                         ',
        \ '                            Custom Spacevim Setup                                   ',
        \ ]

let g:startify_custom_footer =
      \ ['', "   Neither the past, the present nor the future mind can be found", '']

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

let NERDTreeHijackNetrw = 0

let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]

"}}}



"}}}

