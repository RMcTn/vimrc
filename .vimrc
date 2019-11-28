set nocompatible
set path+=**

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

syntax on

set relativenumber

"color desert

set clipboard=unnamed
set number

set shiftround

"Change tabs to 4 spaces
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab 
set showcmd
set copyindent

set smarttab

"Search stuff
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Saves the file (handling the permission-denied error)
cnoremap w!! w !sudo tee % >/dev/null
"Remove search highlights
noremap <silent> <leader><cr> :noh<cr>

"tabs are width of 2 in ruby files
autocmd FileType rb setlocal shiftwidth=2 tabstop = 2

"remap ii to exit modes
imap ii <Esc>
imap jk <Esc>

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
":PluginInstall
Plugin 'VundleVim/Vundle.vim'

Plugin 'fholgado/minibufexpl.vim'

Plugin 'rust-lang/rust.vim'

Plugin 'morhetz/gruvbox'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vimwiki/vimwiki'
Plugin 'majutsushi/tagbar'


Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

"NERDTree
let g:NERDTreeWinPos = 'right'
map <F4> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

"YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"apply FixIt fix
map <F9> :YcmCompleter FixIt<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion=1

"Rust
map <F8> :!cargo build<CR>
let g:rustfmt_autosave = 1

"Tagbar
let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>
nmap <F2> :TagbarOpen fcj<CR>

"MiniBufferExplorer
nmap <F5> :MBEToggle<CR>:MBEFocus<CR>
color gruvbox
set background=dark

nmap X :bd<CR>
