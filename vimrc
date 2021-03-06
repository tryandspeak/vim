"Author Shane K. Panter
"shane@foundationcode.com
"spanter@cs.boisestate.edu"

"Load up pathogen so we can set any plugin options later
execute pathogen#infect()
"setup our leader key
let mapleader = ","


"setup options for gvim GUI
set guioptions-=m "remove the menu bar
set guioptions-=T "remove the toolbar
set guioptions-=r "remove right hand scroll bar

"set supertab to use omnicomplete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

"set up ctags and tlist
let Tlist_Ctags_Cmd = "ctags"
let Tlist_WinWidth = 50
map <F4> :TagbarToggle<cr>
map <F6> :make<cr>
map <F8> :!ctags -R --fields=+nks --excmd=pattern --format=2 .<CR>

"Bind NerdTree to F5
map <F5> :NERDTreeToggle<cr>

"Change the default mapping to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"general code formating options
set linebreak
set nu
set nowrap
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set hlsearch
set incsearch

"Visible tabs for .py files
"4 space tabs
autocmd FileType python set list|set listchars=tab:\|\ |
autocmd FileType python set ts=4|set sts=4|set sw=4

" Make command line two lines high
set ch=2
" Hide the mouse when typing text
set mousehide

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

if has("win32")
	set guifont=Consolas 12
endif
if has("unix")
	if system('uname')=~'Darwin'
		set guifont=Menlo\ Regular:h12
	else
		set guifont=Inconsolata\ Medium\ 12
	endif
endif

"Kill evil trailing white space
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction

autocmd FileWritePre  * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FileWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre   * :call TrimWhiteSpace()

"Turn on vim-airline features
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

filetype plugin indent on
syntax on
