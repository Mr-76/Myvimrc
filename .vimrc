set nocompatible              " be iMproved, required
filetype plugin on                  " required
set path+=** "fuzzi find procurar arquivo em todos subdiretorios"
set wildmenu "abre menu com matches para comandos"
"""""""""""""""""''''''''''''''''''
"Commands maps

	"au BufReadPost,BufNewFile *.md,*.txt,*.tex,*.java delm! | delm A-Z0-9
	au BufReadPost,BufNewFile *.md,*.txt,*.tex,*.java verbose imap <tab>

	nmap <silent> 1  :NERDTreeToggle<CR>

	nnoremap <F1> :UndotreeShow<CR>
	nnoremap <C-r> :redo <CR>
	nnoremap <silent> <F8> :TagbarToggle<CR>
	nnoremap <Up>    :resize -2<CR>
	nnoremap <Down>  :resize +2<CR>
	nnoremap <Left>  :vertical resize -2<CR>
	nnoremap <Right> :vertical resize +2<CR>
	nnoremap <c-q> :bd<CR>
	nnoremap <c-s> :w<CR> <bar> :mks!<CR>

	nnoremap <Leader>s :%s/\<<C-r><C-w>\>/g
	"highlight Pmenu ctermfg=0 ctermbg=46 guifg=#ffffff guibg=#af0000

	

	set completeopt+=longest,menu
	if has('patch-8.1.1902')
	    set completeopt+=popup
	    set completepopup=height:10,width:60,highlight:Pmenu,border:off
	    set pumwidth=10
	endif

	

	"java specific
		autocmd Filetype java nnoremap <F3> :TestNearest<Return>
		autocmd Filetype java nnoremap <F4> :TestFile<Return>
		"autocmd Filetype java nnoremap <F5> :term mvn install -f pom.xml<Return>
		autocmd Filetype java nnoremap <F5> :term ./gradlew bootRun <Return>
		"autocmd Filetype java nnoremap <F6> :cprevious<Return>
		"autocmd Filetype java nnoremap <F8> :cnext<Return>
		nnoremap <silent> <F8> :TagbarToggle<CR>
		autocmd Filetype java nnoremap <F9> :term java %:r<Return>

	"arudino Especific
		au BufRead,BufNewFile *.ino,*.pde set filetype=c++
	"C specific
		autocmd Filetype c nnoremap <F5> :!gcc -o main % && ./main
	"rust specific
		autocmd Filetype rs nnoremap <F5> :!cargo run




filetype plugin indent on
syntax on

"set background=dark
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set encoding=utf-8

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



" Make shift-insert work like in Xterm
if has('gui_running')
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

"White spaces and tabs
:set list
:set listchars=tab:I\ ,trail:_
"Activates highlight on the nontext chars group like these up ^^
"highlight NonText ctermfg=red
"highlight PmenuSel ctermbg=black
"highlight PmenuSel ctermfg=white
"highlight Pmenu ctermbg=gray
"highlight PmenuThumb ctermbg=black

set autoread | au CursorHold * checktime | call feedkeys("lh")


set number

"let g:user_emmet_install_global = 0

"Code to change bettween the relative number in normal mode and absolute line
"in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
