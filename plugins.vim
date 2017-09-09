let s:editor_root = expand(has('nvim') ? '~/.config/nvim' : '~/.vim')

set nocompatible
filetype off
let s:plugin_path = s:editor_root . '/bundle'
let &rtp = &rtp . ',' . s:plugin_path . '/Vundle.vim'

call vundle#begin(s:plugin_path)
	Plugin 'ConradIrwin/vim-bracketed-paste'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'derekelkins/agda-vim'
	Plugin 'dpc/vim-smarttabs'
	Plugin 'fatih/vim-go'
	Plugin 'idris-hackers/idris-vim'
	Plugin 'kevinkjt2000/tmuxline.vim'
	Plugin 'lifepillar/vim-solarized8'
	Plugin 'nathanalderson/yang.vim'
	Plugin 'nfvs/vim-perforce'
	Plugin 'nsf/gocode', {'rtp': 'nvim/'}
	Plugin 'nvie/vim-flake8'
	Plugin 'python-mode/python-mode'
	Plugin 'rust-lang/rust.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-abolish'
	Plugin 'tpope/vim-bundler'
	Plugin 'tpope/vim-dispatch'
	Plugin 'tpope/vim-endwise'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-projectionist'
	Plugin 'tpope/vim-rake'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-unimpaired'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'vim-ruby/vim-ruby'
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'w0rp/ale'
call vundle#end()

