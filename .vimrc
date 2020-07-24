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

set undodir=~/.vimdid
set undofile

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

"remap ii to exit modes
imap ii <Esc>
imap jk <Esc>

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
":PluginInstall
Plugin 'VundleVim/Vundle.vim'

Plugin 'Dimercel/todo-vim'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'machakann/vim-highlightedyank'

Plugin 'vimwiki/vimwiki'
"<leader>ww to open or <leader>wt for new tab

Plugin 'neoclide/coc.nvim'
"coc plugin extension install
":CocInstall coc-rust-analyzer
":CocInstall coc-json coc-tsserver coc-html coc-css

Plugin 'leafOfTree/vim-svelte-plugin'

Plugin 'rust-lang/rust.vim'

Plugin 'morhetz/gruvbox'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

Plugin 'vim-scripts/ZoomWin'
Plugin 'majutsushi/tagbar'

Plugin 'tpope/vim-surround'

Plugin 'airblade/vim-rooter'
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

"FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
map <C-m> :Files<CR>
map <C-n> :Rg<CR>
map <C-l> :Buffer<CR>
let g:fzf_action = { 'ctrl-x': 'vsplit', 'ctrl-z': 'split' }

map <leader><leader> :b#<CR>

"Rust
map <F9> :!cargo run<CR>
map <F8> :!cargo build<CR>
map <F7> :!cargo test<CR>
let g:rustfmt_autosave = 1

"Tagbar
let g:tagbar_left = 1
let g:gutentags_enabled = 0
nmap <F3> :TagbarToggle<CR>
nmap <F2> :TagbarOpen fcj<CR>

color gruvbox
set background=dark

"Todo-vim
nmap <F6> :TODOToggle<CR>

:nnoremap Q :q<CR>

"nvim coc config
"From https://github.com/neoclide/coc.nvim#example-vim-configuration
 "Use tab for trigger completion with characters ahead and navigate.
 "NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
 "other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Completion
" Better display for messages
set cmdheight=2
set signcolumn=yes

"Mapping for save file
"map <leader>w :w<CR>
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Use `leader[` and `leader]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
"list.
nmap <c-k> <Plug>(coc-diagnostic-prev)
nmap <c-j> <Plug>(coc-diagnostic-next)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

set splitbelow
set splitright
