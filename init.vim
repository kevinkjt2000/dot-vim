let mapleader=","  " <leader> is ,

runtime plugins.vim
runtime tabline.vim

if has('nvim')
	" terminal mode escape mapping is more sane
	tnoremap <Esc> <C-\><C-n>
endif

" Match ctags in a case sensitive manner when using C-]
fun! MatchCaseTag()
	let ic = &ic
	set noignorecase
	try
		exe 'tjump ' . expand('<cword>')
	finally
		let &ic = ic
	endtry
endfun
nnoremap <silent><C-]> :call MatchCaseTag()<CR>

autocmd FileType python map <buffer> <F7> :call Flake8()<CR>

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']  " Ignore some files in NERDTree

" automatically reload vimrc when it is saved
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" cool colors (requires a 24-bit terminal)
set termguicolors
syntax enable
silent! colorscheme solarized8_dark
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#ale#enabled = 1

" it is nice to have the mouse working
set mouse=a

" Set to auto read when a file is changed from the outside
set autoread

" tab stuff
filetype plugin indent on       " load filetype-specific indent files
set shiftwidth=2
set tabstop=2
set softtabstop=0
set noexpandtab
set smarttab
set autoindent
set smartindent

" toggle hiding whitespace characters
set listchars=tab:>-,extends:>,precedes:<
map <leader>i :set list!<CR>

set number                      " show line numbers
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
set wrap                        " wrap lines

set wildmenu                    " visual autocompete for command menu
set wildmode=list:longest       " make <TAB> complete only up the point of ambiguity
set wildignore=*.o,*~,*.pyc     " Ignore some files
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*,.DS_Store\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store/*
endif

set lazyredraw     " Don't redraw while executing macros (good performance config)

set showmatch      " highlight matching [{()}]

set ignorecase     " Ignore case when searching
set smartcase      " When searching try to be smart about cases
set incsearch      " search as characters are entered
set hlsearch       " highlight matches

" turn off search highlight with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" goto defintion of symbol in languages supported by YouCompleteMe
nnoremap <Leader>] :YcmCompleter GoTo<CR>

nnoremap <leader>oc :e %<.c<CR>
nnoremap <leader>oC :e %<.cpp<CR>
nnoremap <leader>oh :e %<.h<CR>
nnoremap <leader>oH :e %<.hpp<CR>

" swap between the current buffer and the last buffer
nnoremap <leader><leader> <C-^>

" change CtrlP to open with <leader>f instead
let g:ctrlp_map = '<leader>f'
if executable('rg')
	set grepprg=rg\ --no-heading
	let g:ctrlp_user_command = 'rg %s -g "" --files'
endif

set foldenable
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " guards against too many folds
nnoremap <space> za             " space open/closes folds
set foldmethod=indent           " fold based on indent level

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

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
