" Vim-Plug {{{
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
"Plug 'valloric/youcompleteme'
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fireplace', {'for': 'clojure'}
"Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'fatih/vim-go', {'tag': '*'}
Plug 'nsf/gocode', {'tag': 'v.20150303', 'rtp':'vim'}
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}

" General {{{
set nocompatible   
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
set clipboard+=unnamed " Vim的默认寄存器和系统剪贴板共享
set winaltkeys=no
" }}}

" GUI {{{
"colorscheme tomorrow-night
let base16colorspace=256
colorscheme base16-oceanicnext
set cursorline
set hlsearch
set incsearch
set number
set relativenumber
set showcmd
set splitbelow
set splitright
"set guifont=Inconsolata:h20
" }}}

" Format {{{
set autoindent
set smartindent
set tabstop=4
set expandtab
set softtabstop=4
"set foldmethod=indent
set shiftwidth=4
set ls=2
syntax on
" }}}

" Keymap {{{
let mapleader=","
let g:mapleader=","
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>

" 移动分割窗口
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l 

" }}}

