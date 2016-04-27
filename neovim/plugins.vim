if &compatible
  set nocompatible
end

"vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugins')

" Thought bot Define bundles via Github repos
" Plug 'christoomey/vim-run-interactive'
  "Project Management
  Plug 'vim-ctrlspace/vim-ctrlspace'
  Plug 'scrooloose/nerdTree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-vinegar'

  "Plug 'jistr/vim-nerdtree-tabs'

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'terryma/vim-multiple-cursors'
  "Plug 'unblevable/quick-scope'


  Plug 'rdnetto/YCM-Generator',{ 'branch': 'stable'}
" Plug 'pbrisbin/vim-mkdir'
  " Asynchronous maker and linter (needs linters to work)
  Plug 'benekastah/neomake', { 'on': ['Neomake'] }
  "Plug 'scrooloose/syntastic'

  " CamelCase and snake_case motions
  Plug 'bkad/CamelCaseMotion'


  " Custom text objects creation (dependency for the latter)
  Plug 'kana/vim-textobj-user'
  " Ruby block text object (vir-var)
  Plug 'nelstrom/vim-textobj-rubyblock'

  " Easily expand selected region
  Plug 'terryma/vim-expand-region'

  " Easy alignment
  Plug 'godlygeek/tabular', { 'on':  'Tabularize' }

" Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  "Languages
  Plug 'kchmck/vim-coffee-script'
  "Rails/Ruby
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-haml'
  Plug 'janko-m/vim-test'
  Plug 'thoughtbot/vim-rspec'
  Plug 'ecomba/vim-ruby-refactoring'
  Plug 'tpope/vim-endwise'

    " ---------------------------------------------------------------------------------------------------------------------
  " JS (ES6, React) {{{
  " ---------------------------------------------------------------------------------------------------------------------

  " JS syntax
  Plug 'jelera/vim-javascript-syntax'
  " JS libs syntax (React, Angular)
  Plug 'othree/javascript-libraries-syntax.vim'
  " JSX syntax (needs vim-javascript for indentation)
  Plug 'mxw/vim-jsx' | Plug 'pangloss/vim-javascript'
  " Typescript syntax
  Plug 'leafgarland/typescript-vim'
  " JSON syntax
  Plug 'sheerun/vim-json'
  "}}}


    " ---------------------------------------------------------------------------------------------------------------------
  " HTML/CSS {{{
  " ---------------------------------------------------------------------------------------------------------------------

  " HTML5 syntax
  Plug 'othree/html5.vim'
  " SCSS syntax
  Plug 'cakebaker/scss-syntax.vim'
  " Color highlighter
  Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xhtml', 'javascript', 'javascript.jsx'] }


    " ---------------------------------------------------------------------------------------------------------------------
  " Other languages {{{
  " ---------------------------------------------------------------------------------------------------------------------

  " Elixir syntax
  Plug 'elixir-lang/vim-elixir'
  " Elm syntax
  Plug 'lambdatoast/elm.vim'
  " Yaml indentation
  Plug 'martin-svk/vim-yaml'
  " Markdown syntax
  Plug 'tpope/vim-markdown'
  " Git syntax
  Plug 'tpope/vim-git'
  " Tmux syntax
  Plug 'tejr/vim-tmux'
  " Dockerfile
  Plug 'honza/dockerfile.vim'
  "}}}


  Plug 'vim-scripts/tComment'
  "Move
  Plug 'justinmk/vim-sneak'
  Plug 'matze/vim-move'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'sickill/vim-pasta'
  Plug 'AndrewRadev/splitjoin.vim'


  "Search
  "Plug 'bronson/vim-visual-star-search'


  "Terminal
  Plug 'kassio/neoterm'


  "Git
  Plug 'airblade/vim-gitgutter'

  "Theme
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'

  " "Snippets
  " Plug 'MarcWeber/vim-addon-mw-utils'
  " Plug 'tomtom/tlib_vim'
  " Plug 'garbas/vim-snipmate'
  " Plug 'honza/vim-snippets'

  " Snippets
  "Plug 'shougo/neosnippet.vim'
  "Plug 'shougo/neosnippet-snippets'"
  " Snippet support (C-j)
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "Plug 'Valloric/YouCompleteMe'
  "Plug 'ervandew/supertab'
  "deoplete"
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'Shougo/vimproc.vim'
  Plug 'osyo-manga/vim-monster'




call plug#end()
