set nocompatible
set path+=**

syntax on

set relativenumber

color desert

set clipboard=unnamed
set number
"Change tabs to 4 spaces
set tabstop=4 shiftwidth=4 expandtab
set showcmd

set copyindent
set showmatch
set ignorecase
set smartcase

set smarttab

set hlsearch
set incsearch

autocmd FileType rb setlocal shiftwidth=2 tabstop = 2

"remap ii to exit modes
imap ii <Esc>

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

call vundle#end()
filetype plugin indent on

"open nerd tree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeTabsToggle<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
"apply FixIt fix
map <F9> :YcmCompleter FixIt<CR>

