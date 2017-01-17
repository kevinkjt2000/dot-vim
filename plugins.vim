let s:editor_root = expand(has('nvim') ? '~/.config/nvim' : '~/.vim')

set nocompatible
filetype off
let s:plugin_path = s:editor_root . '/bundle'
let &rtp = &rtp . ',' . s:plugin_path . '/Vundle.vim'

call vundle#begin(s:plugin_path)
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'rust-lang/rust.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'lifepillar/vim-solarized8'
  Plugin 'nathanalderson/yang.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'davidhalter/jedi-vim'
  Plugin 'nfvs/vim-perforce'
  Plugin 'Yggdroot/LeaderF'
  Plugin 'idris-hackers/idris-vim'
  Plugin 'ConradIrwin/vim-bracketed-paste'
  Plugin 'tpope/vim-projectionist'
  Plugin 'c-brenn/phoenix.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'dpc/vim-smarttabs'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'nvie/vim-flake8'
call vundle#end()

