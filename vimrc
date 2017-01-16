let s:editor_root = expand(has('nvim') ? '~/.config/nvim' : '~/.vim')

let mapleader=","  " <leader> is ,

" Vundle plugins
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
call vundle#end()

set showtabline=2     " always show tab pages line
function! MyTabLine()
  let s = ''
  for tab in range(1, tabpagenr('$'))
    let s .= '%' . tab . 'T' " start a tab

    let is_tab_active = (tab == tabpagenr())
    let s .= (is_tab_active ? '%#TabLineSel#' : '%#TabLine#')

    let s .= tab

    let num_windows_in_tab = tabpagewinnr(tab, '$')
    let s .= (num_windows_in_tab > 1 ? ':' . num_windows_in_tab : '')

    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[tabpagewinnr(tab) - 1]
    let bufname = bufname(bufnr)
    let s .= ' ' . (bufname != '' ? pathshorten(bufname) : '[Untitled]')

    let is_modified = getbufvar(bufnr, '&mod')
    let s .= (is_modified ? ' +' : '')
  endfor
  
  let s .= '%#TabLineFill#' " highlight gaps
  let s .= '%T' " resets tab page number?
  let s .= '%=' " seperate left-aligned from right-aligned
  let s .= '%#TabLine#' " set highlight for the 'X' below
  let s .= '%999XX' " places an 'X' at the far-right
  return s
endfunction
set tabline=%!MyTabLine()

" Disable the slowest jedi
let g:jedi#show_call_signatures = 0
let g:jedi#show_function_definition = 0
let g:jedi#popup_on_dot = 0

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Ignoring this silly -Z deprecration that the rustc team has been wishy washy
" on for months now...
let g:syntastic_quiet_messages = {"regex": 'is unstable and should only be used on the nightly compiler, but it is currently accepted for backwards compatibility; this will soon change, see issue #31847 for more details'}

" rust-lang/rust.vim is having some serious trouble giving things that they
" promise in their README, so I have to do their work for them...
autocmd FileType rust let g:syntastic_rust_checkers = ['rustc']

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

" SYNTASTIC!!!!!
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

nnoremap <leader>oc :e %<.c<CR>
nnoremap <leader>oC :e %<.cpp<CR>
nnoremap <leader>oh :e %<.h<CR>
nnoremap <leader>oH :e %<.hpp<CR>

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

" Enable per-directory .vimrc files
set exrc
set secure

