set nocompatible              " be iMproved, required
filetype plugin on                  " required
set path+=** "fuzzi find"
set wildmenu
"""""""""""""""""''''''''''''''''''
"Commands maps

	mksession! Session.vim
	"au BufReadPost,BufNewFile *.md,*.txt,*.tex,*.java delm! | delm A-Z0-9
	au BufReadPost,BufNewFile *.md,*.txt,*.tex,*.java verbose imap <tab>

	nmap <silent> 1  :NERDTreeToggle<CR>
	nnoremap <silent> 2 <Plug>(YCMToggleInlayHints)
	"nmap <silent> 2 :SyntasticToggleMode<CR>
	nmap <silent> 3 :YcmCompleter Format<CR>


	nnoremap <silent> <C-f> :YcmCompleter FixIt<CR>


	nnoremap <Up>    :resize -2<CR>
	nnoremap <Down>  :resize +2<CR>
	nnoremap <Left>  :vertical resize -2<CR>
	nnoremap <Right> :vertical resize +2<CR>
	nnoremap <c-q> :bd<CR>
	nnoremap <F1> :UndotreeShow<CR> 
	nnoremap <c-s> :w<CR> <bar> :mks!<CR> <bar> :set foldmethod=indent <CR>

	


	nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
	highlight Pmenu ctermfg=0 ctermbg=46 guifg=#ffffff guibg=#af0000

	let g:ycm_autoclose_preview_window_after_completion = 1
	

	set completeopt+=longest,menu
	if has('patch-8.1.1902')
	    set completeopt+=popup
	    set completepopup=height:10,width:60,highlight:Pmenu,border:off
	    set pumwidth=10
	endif

	highlight YcmErrorLine guibg=#3f0000
	highlight YcmWarningSection guibg=#ffff00
	
	"imap <silent> <C-l> <Plug>(YCMToggleSignatureHelp)

	"java specific
		autocmd Filetype java set makeprg=javac\ %
		autocmd Filetype java nnoremap <F7> :make<Return>:copen<Return>
		autocmd Filetype java nnoremap <F6> :cprevious<Return>
		autocmd Filetype java nnoremap <F8> :cnext<Return>
		autocmd Filetype java nnoremap <F5> :term mvn install -f pom.xml<Return>
		autocmd Filetype java nnoremap <F9> :term java %:r<Return>
		autocmd Filetype java nnoremap <F2> :TestFile<Return>
		autocmd Filetype java nnoremap <F3> :TestNearest<Return>
	"arudino Especific
	au BufRead,BufNewFile *.ino,*.pde set filetype=c++


filetype plugin indent on   
syntax on
filetype plugin indent on


set background=dark
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set nu
set encoding=utf-8
filetype plugin indent on

set showcmd		" Show (partial) command in status line.
set smartcase		" Do smart case matching
set mouse=a		" Enable mouse usage (all modes)

if &compatible
  set nocompatible
endif

set backspace=indent,eol,start
set ruler
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set suffixes-=.h
set suffixes-=.obj

" Move temporary files to a secure location to protect against CVE-2017-1000382
if exists('$XDG_CACHE_HOME')
  let &g:directory=$XDG_CACHE_HOME
else
  let &g:directory=$HOME . '/.cache'
endif
let &g:undodir=&g:directory . '/vim/undo//'
let &g:backupdir=&g:directory . '/vim/backup//'
let &g:directory.='/vim/swap//'
" Create directories if they doesn't exist
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif
if ! isdirectory(expand(&g:backupdir))
  silent! call mkdir(expand(&g:backupdir), 'p', 0700)
endif
if ! isdirectory(expand(&g:undodir))
  silent! call mkdir(expand(&g:undodir), 'p', 0700)
endif



ab STJV public <C-G> class name_of_file{<CR><tab>public static void main(String[] args){<CR><tab>}<CR>}<esc>
ab PSVM public static void main(){<CR>} 
ab FMAIN if __name__ = '__main__':<CR>
" Make shift-insert work like in Xterm
if has('gui_running')
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

""":highlight ExtraWhitespace ctermbg=red guibg=red

set autoread | au CursorHold * checktime | call feedkeys("lh")

autocmd Filetype html,css setlocal tabstop=4

autocmd Filetype python,c,haskell,java setlocal tabstop=4


















