set nocompatible              " be iMproved, required
filetype plugin on                  " required
set path+=** "fuzzi find"
set wildmenu
""""""""""""""""""""""""""""""""""""""""""""""command! MakeTags !ctags -R . "tags with ctags nvim not working <>:?" " g^] ^] ctrl -- ] tags do codigo acha"
"^x^f procura nome dos arquivos
"""""""""""""""""""""""""""""""""""""""""""""""":silent exec "!command ctags -R ."
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
Plugin 'VundleVim/Vundle.vim'

Plugin 'kshenoy/vim-signature'
"Debug
Plugin 'puremourning/vimspector'
Plugin 'nvie/vim-flake8'

let g:vimspector_enable_mappings = 'HUMAN'
""""""""""""''''''""""""""""""
"html
Plugin 'alvan/vim-closetag'
Plugin 'HTML-AutoCloseTag'
Plugin 'shime/vim-livedown'
Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
""""""""""""""""""""""""""
"Bidings/git
Plugin 'rbong/vim-flog'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
""""""""""""""""""""""""""""
"Python
Plugin 'heavenshell/vim-pydocstring'
"Plugin 'davidhalter/jedi-vim'
let g:pydocstring_doq_path = '/home/shadow/envs_py/env/ENV/bin/doq'
Plugin 'jmcantrell/vim-virtualenv'
"""""""''''''''''''''''"""""""
"Arduino
Plugin 'sudar/vim-arduino-syntax'
Plugin 'stevearc/vim-arduino'
""""""""""""""""""""""""""""""
"Nvim lsp's
Plugin 'williamboman/nvim-lsp-installer'
Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-cmp' 
"Plugin 'mfussenegger/nvim-jdtls' can mix with debug
"Plugin 'neoclide/coc.nvim'
Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'hrsh7th/cmp-buffer'
Plugin 'hrsh7th/cmp-path'
Plugin 'hrsh7th/cmp-cmdline'
"Plugin 'artur-shaik/jc.nvim' no more
Plugin 'dcampos/cmp-snippy'
Plugin 'dcampos/nvim-snippy'
Plugin 'preservim/tagbar'
"""Plugin 'simrat39/symbols-outline.nvim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Autocomplete
Plugin 'valloric/youcompleteme'
""""""""""""""""""""""""""""
"Docstring
Plugin 'kkoomen/vim-doge'
let g:doge_enable_mappings = 1
"let g:doge_mapping
""""""""""""""""""""""""""
"Better writing
Plugin 'jiangmiao/auto-pairs'
Plugin 'frazrepo/vim-rainbow'
let g:rainbow_active = 1
"Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'
Plugin 'chrisbra/csv.vim'
""""""""""""""""""""""""""""
"Formating/linting
Plugin 'neomake/neomake'
let g:neomake_python_enabled_makers = ['pylint']
Plugin 'sbdchd/neoformat'
"Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
Plugin 'https://github.com/z3t0/arduvim' 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""
"UI
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


"Maven
Plugin 'mikelue/vim-maven-plugin'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_statusline_ontop=0

""""""""""""""""""""""""""""""""""
"Navigation
Plugin 'scrooloose/nerdtree'
""""""""""""""""""""""""""""""""""

"""""""""""""""""''''''''''''''''''
"Commands maps

	mksession Session.vim
	"au BufReadPost,BufNewFile *.md,*.txt,*.tex,*.java delm! | delm A-Z0-9
	au BufReadPost,BufNewFile *.md,*.txt,*.tex,*.java verbose imap <tab>
	nmap <silent> 1  :NERDTreeToggle<CR>
	nnoremap <silent> 2 <Plug>(YCMToggleInlayHints)
	"nmap <silent> 2 :SyntasticToggleMode<CR>
	nmap <silent> 3 :YcmCompleter Format<CR>
	nnoremap <Up>    :resize -2<CR>
	nnoremap <Down>  :resize +2<CR>
	nnoremap <Left>  :vertical resize -2<CR>
	nnoremap <Right> :vertical resize +2<CR>
	nnoremap <c-q> :bd<CR>
	nnoremap <F1> :UndotreeShow<CR> 
	nnoremap <c-s> :w<CR> <bar> :mks!<CR>
	nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
	highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000


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


""""""""""""""""""
"Tests
Plugin 'vim-test/vim-test'
""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

:highlight ExtraWhitespace ctermbg=red guibg=red

set autoread | au CursorHold * checktime | call feedkeys("lh")

autocmd Filetype html,css setlocal tabstop=4

autocmd Filetype python,c,haskell,java setlocal tabstop=4

















