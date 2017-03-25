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
	Plugin 'nfvs/vim-perforce'
	Plugin 'idris-hackers/idris-vim'
	Plugin 'ConradIrwin/vim-bracketed-paste'
	Plugin 'tpope/vim-projectionist'
	Plugin 'tpope/vim-fugitive'
	Plugin 'dpc/vim-smarttabs'
	Plugin 'vim-ruby/vim-ruby'
	Plugin 'nvie/vim-flake8'
	Plugin 'tpope/vim-endwise'
	Plugin 'python-mode/python-mode'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'edkolev/tmuxline.vim'
	Plugin 'tpope/vim-unimpaired'
	Plugin 'derekelkins/agda-vim'
	Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()

