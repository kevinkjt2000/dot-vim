let mapleader=","  " <leader> is ,

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

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

" For Python files call flake 8 with F7
autocmd FileType python map <buffer> <F7> :call Flake8()<CR>

" Some helpful shortcuts for C++ GDB
autocmd FileType cpp map <buffer> <leader>d :GdbLocal confloc#me a.out ""<CR>
autocmd FileType cpp map <buffer> <leader>b :GdbToggleBreak<CR><CR>

" Toggle hiding whitespace characters
map <leader>i :set list!<CR>

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Goto defintion of symbol in languages supported by YouCompleteMe
nnoremap <Leader>] :YcmCompleter GoTo<CR>

" Switch to alternate file using tpope/vim-projectionist
nnoremap <leader>a :A<CR>

" Save file with leader w
nnoremap <leader>w :w<CR>

" Swap between the current buffer and the last buffer
nnoremap <leader><leader> <C-^>

" Change CtrlP to open with <leader>f instead
let g:ctrlp_map = '<leader>f'
" Open CtrlP in buffer mode with <leader>b
nnoremap <leader>b :CtrlPBuffer<CR>

" Spacebar open/closes folds
nnoremap <space> za

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" jk is escape
inoremap jk <esc>
