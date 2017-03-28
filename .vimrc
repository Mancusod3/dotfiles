let g:netrw_liststyle=3
let g:netrw_banner=0

set background=dark 
set relativenumber 
set number
set autoindent
set smartindent             
set smartcase
set expandtab
set shiftwidth=4
set tabstop=4
set incsearch
set hlsearch
set clipboard=unnamed
set swapfile
set dir=~/tmp
set nocompatible

nnoremap ; :
nnoremap : ;

nmap <C-k> O<Esc>j
nmap <C-j> o<Esc>k

" command PrettyHtml :s/<[^>]*>/\r&\r/g|g/^$/d|normal gg=G 

syntax enable

filetype off

" VUNDLE
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'joonty/vdebug'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Special case for ctrlp because it wanted to be difficult
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Options for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.sql     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Optional:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Drop Vdebug settings at the end of the file " 
let g:vdebug_options={
\ 'break_on_open': 1,
\ 'port': '9009',
\ 'watch_window_style': 'compact'
\}

let g:vdebug_keymap={}
let g:vdebug_keymap['run'] = '<c-s>'


let g:airline#extensions#tabline#enabled = 1
