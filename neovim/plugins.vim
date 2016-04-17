if &compatible
  set nocompatible
end

"vim-plug
call plug#begin('~/.config/nvim/plugins')

" Thought bot Define bundles via Github repos
" Plug 'christoomey/vim-run-interactive'
  "Project Management
  Plug 'vim-ctrlspace/vim-ctrlspace'
  Plug 'scrooloose/nerdTree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'terryma/vim-multiple-cursors'

  Plug 'Valloric/YouCompleteMe'
  Plug 'rdnetto/YCM-Generator',{ 'branch': 'stable'}
" Plug 'pbrisbin/vim-mkdir'
  Plug 'scrooloose/syntastic'

" Plug 'tpope/vim-endwise'
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

  Plug 'vim-scripts/tComment'
  "Move
  Plug 'justinmk/vim-sneak'
  Plug 'matze/vim-move'

  "Theme
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "Git
  Plug 'airblade/vim-gitgutter'

  "Snippets
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'



call plug#end()
