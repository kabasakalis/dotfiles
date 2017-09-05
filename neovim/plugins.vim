" ======================================================================================================================
"
" Plugin manager (Plug) settings.
" Author : Spiros Kabasakalis <Kabasakalis@gmail.com>
" ======================================================================================================================

if &compatible
  set nocompatible
end
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugins')


" ---------------------------------------------------------------------------------------------------------------------
" Color Themes {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'whatyouhide/vim-gotham'
Plug 'jacoborus/tender'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation {{{
" ---------------------------------------------------------------------------------------------------------------------

Plug 'vim-scripts/tComment'
Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'terryma/vim-smooth-scroll'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bkad/CamelCaseMotion'  " CamelCase and snake_case motions
Plug 'kana/vim-textobj-user' " Custom text objects creation (dependency for the latter)
Plug 'nelstrom/vim-textobj-rubyblock' " Ruby block text object (vir-var)
Plug 'terryma/vim-expand-region' " Easily expand selected region
Plug 'godlygeek/tabular', { 'on':  'Tabularize' } " Easy alignment
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
" Search {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'easymotion/vim-easymotion'
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] } " Ag wrapper (Unite grep alternative) search and edit
"}}}
" ---------------------------------------------------------------------------------------------------------------------
" Project Management {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdTree'
Plug 'tpope/vim-vinegar'
Plug  'mhinz/vim-startify'
" Plug 'vim-ctrlspace/vim-ctrlspace'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
" Terminal {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'kassio/neoterm'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
" Git {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
" Status Bar Theme vim-airline {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
"  Snippet ultisnips {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'SirVer/ultisnips'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
"  Rails/Ruby {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-haml'
Plug 'janko-m/vim-test'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-endwise'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
" deoplete autocomplete {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'osyo-manga/vim-monster', { 'do': ':UpdateRemotePlugins' }
" Plug 'Valloric/YouCompleteMe'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
" vim-tmux-navigator {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'christoomey/vim-tmux-navigator'
"}}}
" ---------------------------------------------------------------------------------------------------------------------
" Miscellaneous {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'hwartig/vim-seeing-is-believing'
"}}}
"
" ---------------------------------------------------------------------------------------------------------------------
"  Asynchronous maker and linter w0rp/ale  {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'w0rp/ale'
"}}}
"

" ---------------------------------------------------------------------------------------------------------------------
"  AutoCompletion roxma/nvim-completion-manager {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'roxma/nvim-completion-manager'
"}}}
"

" ---------------------------------------------------------------------------------------------------------------------
" C++
" ---------------------------------------------------------------------------------------------------------------------
"  c-supportWolfgangMehner/c-support
" Plug 'WolfgangMehner/c-support', { 'for': 'cpp' }
"
"  Doxygen
Plug 'DoxygenToolkit.vim', { 'for': 'cpp' }
" Additional syntax highlighting that I use for C++11/14/17
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
" This Vim plugin will help switching between companion files (e.g. .h and .cpp files)
Plug 'derekwyatt/vim-fswitch', { 'for': 'cpp' }
" Plug 'zchee/deoplete-clang', { 'for': 'cpp' }
"
" C++ autocomplete
Plug 'Rip-Rip/clang_complete', {'for': 'cpp' }

" Style format with clang-format
Plug 'rhysd/vim-clang-format', {'for': 'cpp' }

"}}}
"

" ---------------------------------------------------------------------------------------------------------------------
" Languages {{{
" ---------------------------------------------------------------------------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xhtml', 'javascript', 'javascript.jsx'] }
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
Plug 'digitaltoad/vim-pug'
Plug 'slim-template/vim-slim'

"}}}

call plug#end()
