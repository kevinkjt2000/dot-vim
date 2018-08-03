runtime plugins.vim   " Load plugins first :)

runtime airline.vim
runtime mappings.vim

" Disable prettier default autoformat
let g:prettier#autoformat = 0
" Automatically format some web filetypes with prettier
" TODO: investigate using async version
autocmd BufWritePre *.js,*.ts,*.css,*.scss Prettier

" Enable .ropeproject creation with python-mode plugin
let g:pymode_rope = 1

" Disable pymode linting, since ALE handles that
let g:pymode_lint = 0

" Automatically reload vimrc when it is saved
augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Automatically turn off line numbers in terminal mode
augroup no_terminal_line_numbers
	autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Cool colors!! (requires a 24-bit terminal)
set termguicolors
syntax enable
silent! colorscheme solarized8_dark
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" ALE options
let g:ale_linters = {
\   'cpp': ['clang', 'clangtidy', 'g++'],
\   'haskell': ['ghc'],
\   'python': ['flake8', 'pylint'],
\   'typescript': ['tslint'],
\}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" Newer versions of GHC require linking dynamically now on Arch
let g:ale_haskell_ghc_options = '-dynamic'

" Fix https://github.com/phoenixframework/phoenix/issues/1165
augroup AleGroup
	autocmd!
	autocmd User ALELint call TouchOpenFile()
augroup END

func! TouchOpenFile()
	if &ft == 'elixir'
		let g:ale_enabled = 0
		sleep 500m
		w
		let g:ale_enabled = 1
	endif
endfunc

" Configure vim-closetag to also work for languages like ruby and elixir
let g:closetag_filenames = '*.html,*.eex,*.erb'

" Close any <tag> with </tag> in these files (even tags like <br>)
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx'

" Automatically format elixir files
let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'

" It is nice to have the mouse working
set mouse=a

" Set to auto read when a file is changed from the outside
set autoread

" Default indentation settings that are overriden by .editorconfig files
filetype plugin indent on       " load filetype-specific indent files
set shiftwidth=2
set tabstop=2
set softtabstop=0
set noexpandtab
set smarttab
set autoindent
set smartindent

" Configure invisible character alternates
set listchars=tab:>-,extends:>,precedes:<

set number                      " Show line numbers
set showcmd                     " Show command in bottom bar
set cursorline                  " Highlight current line
set wrap                        " Wrap lines

set wildmenu                    " Visual autocompete for command menu
set wildmode=list:longest       " Make <TAB> complete only up the point of ambiguity
set wildignore+=*.o,*~,*.pyc    " Ignore some files
set wildignore+=*/.DS_Store/*

set lazyredraw     " Don't redraw while executing macros (good performance config)

set showmatch      " Highlight matching [{()}]

set ignorecase     " Ignore case when searching
set smartcase      " When searching try to be smart about cases
set incsearch      " Search as characters are entered
set hlsearch       " Highlight matches

set nofixendofline " Don't automatically add a new line to the end of files

if executable('rg')
	set grepprg=rg\ --no-heading
	let g:ctrlp_user_command = 'rg %s -g "" --files'
endif

set foldenable
set foldlevelstart=10           " Open most folds by default
set foldnestmax=10              " Guards against too many folds
set foldmethod=indent           " Fold based on indent level

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Show lines of context near edges when scrolling up and down
set scrolloff=3

" Enable per-directory .vimrc files
set exrc
set secure

" Allow switching buffers without writing to disk
set hidden
