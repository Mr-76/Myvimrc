set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
Plugin 'VundleVim/Vundle.vim'
"
Plugin 'kshenoy/vim-signature'
"
Plugin 'tpope/vim-fugitive'
""
Plugin 'puremourning/vimspector'
let g:vimspector_enable_mappings = 'HUMAN'
""
Plugin 'scrooloose/nerdtree'
""
Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

""Plugin 'maralla/completor.vim'
""
Plugin 'shime/vim-livedown'
""
Plugin 'frazrepo/vim-rainbow'
""
Plugin 'nvie/vim-flake8'
""
Plugin 'valloric/youcompleteme'
""
let g:rainbow_active = 1
""
""Plugin 'git://git.wincent.com/command-t.git'
""
"Plugin 'eaglemt/neco-ghc' 
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
""

"Plugin 'racer-rust/vim-racer'
"set hidden
"let g:racer_cmd = "/home/cremoso/.cargo/bin/racer"
"let g:racer_insert_paren = 1
""
"Plugin 'davidhalter/jedi-vim'
""
"Plugin 'rip-rip/clang_complete'
""
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
""
"Plugin 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""

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

""nnoremap gp ipublic class name_of_file{public static void main(String[] args){}}
""or

"let extension = expand('%:e')

"let java_e= ".java"

"if  extension == java_c

ab STJV public <C-G> class name_of_file{<CR><tab>public static void main(String[] args){<CR><tab>}<CR>}<esc>
ab PSVM public static void main(){<CR>} 

" Make shift-insert work like in Xterm
if has('gui_running')
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif
