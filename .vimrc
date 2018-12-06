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

color desert

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

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vimwiki/vimwiki'
Plugin 'ternjs/tern_for_vim'

call vundle#end()
filetype plugin indent on

"open nerd tree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeTabsToggle<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"apply FixIt fix
map <F9> :YcmCompleter FixIt<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion=1

let g:tern_show_argument_hints='on_hold'
" and 
let g:tern_map_keys=1


