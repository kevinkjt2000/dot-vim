let s:editor_root = expand(has('nvim') ? '~/.config/nvim' : '~/.vim')

set nocompatible
filetype off
let s:plugin_path = s:editor_root . '/bundle'
let &rtp = &rtp . ',' . s:plugin_path . '/Vundle.vim'

call vundle#begin(s:plugin_path)
	Plugin 'alvan/vim-closetag'
	Plugin 'burnettk/vim-angular'
	Plugin 'cespare/vim-toml'
	Plugin 'ConradIrwin/vim-bracketed-paste'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'dpc/vim-smarttabs'
	Plugin 'editorconfig/editorconfig-vim'
	Plugin 'elixir-editors/vim-elixir'
	Plugin 'fatih/vim-go'
	Plugin 'vim-scripts/groovyindent-unix'
	Plugin 'huawenyu/neogdb.vim'
	Plugin 'idris-hackers/idris-vim'
	Plugin 'jacoborus/tender.vim'
	Plugin 'jakwings/vim-pony'
	Plugin 'jremmen/vim-ripgrep'
	Plugin 'junegunn/vader.vim'
	Plugin 'junegunn/vim-easy-align'
	Plugin 'kevinkjt2000/agda-vim'
	Plugin 'kevinkjt2000/robotframework-vim'
	Plugin 'kevinkjt2000/tmuxline.vim'
	Plugin 'leafgarland/typescript-vim'
	Plugin 'mhinz/vim-mix-format'
	Plugin 'moll/vim-node'
	Plugin 'nathanalderson/yang.vim'
	Plugin 'neovimhaskell/haskell-vim'
	Plugin 'nfvs/vim-perforce'
	Plugin 'nsf/gocode', {'rtp': 'nvim/'}
	Plugin 'nvie/vim-flake8'
	Plugin 'prettier/vim-prettier'
	Plugin 'python-mode/python-mode'
	Plugin 'rust-lang/rust.vim'
	Plugin 'slashmili/alchemist.vim'
	Plugin 'tpope/vim-abolish'
	Plugin 'tpope/vim-bundler'
	Plugin 'tpope/vim-dispatch'
	Plugin 'tpope/vim-endwise'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-projectionist'
	Plugin 'tpope/vim-rake'
	Plugin 'tpope/vim-repeat'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-unimpaired'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'vim-ruby/vim-ruby'
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'w0rp/ale'
call vundle#end()

