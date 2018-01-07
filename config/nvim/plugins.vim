let s:editor_root = expand(has('nvim') ? '~/.config/nvim' : '~/.vim')

set nocompatible
filetype off
let s:plugin_path = s:editor_root . '/bundle'
let &rtp = &rtp . ',' . s:plugin_path . '/Vundle.vim'

call vundle#begin(s:plugin_path)
	Plugin 'burnettk/vim-angular'
	Plugin 'ConradIrwin/vim-bracketed-paste'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'derekelkins/agda-vim'
	Plugin 'dpc/vim-smarttabs'
	Plugin 'editorconfig/editorconfig-vim'
	Plugin 'fatih/vim-go'
	Plugin 'huawenyu/neogdb.vim'
	Plugin 'idris-hackers/idris-vim'
	Plugin 'junegunn/vader.vim'
	Plugin 'kevinkjt2000/tmuxline.vim'
	Plugin 'leafgarland/typescript-vim'
	Plugin 'lifepillar/vim-solarized8'
	Plugin 'moll/vim-node'
	Plugin 'nathanalderson/yang.vim'
	Plugin 'nfvs/vim-perforce'
	Plugin 'nsf/gocode', {'rtp': 'nvim/'}
	Plugin 'nvie/vim-flake8'
	Plugin 'python-mode/python-mode'
	Plugin 'rust-lang/rust.vim'
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

