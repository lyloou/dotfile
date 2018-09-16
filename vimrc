" Vim-Plug {{{
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/mru.vim'
Plug 'kien/ctrlp.vim'
Plug 'dkprice/vim-easygrep'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'

"Plug 'valloric/youcompleteme'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-github-dashboard'

Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-pathogen'

Plug 'vim-scripts/vim-auto-save'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-fireplace', {'for': 'clojure'}
"Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'fatih/vim-go', {'tag': '*'}
Plug 'nsf/gocode', {'tag': 'v.20150303', 'rtp':'vim'}
call plug#end()
" }}}

" General {{{
set title
set nocompatible   
set nobackup
set noswapfile
set history=1024
set autochdir
set autoread
set whichwrap=b,s,<,>,[,]
set nobomb
set ruler
set backspace=indent,eol,start whichwrap+=<,>,[,]
set clipboard+=unnamed " Vim的默认寄存器和系统剪贴板共享
set winaltkeys=no
set t_ti= t_te= " 退出终端时内容显示在终端上
"set colorcolumn=81
set showmatch
set matchtime=2
" }}}

" GUI {{{
if has("gui_running")
    set background=dark
    color solarized
endif
set cursorline
"set cursorcolumn
set hlsearch
set incsearch
set number
set relativenumber
set relativenumber number

set showcmd
set splitbelow
set splitright
"set guifont=Inconsolata:h20
" }}}

" Format {{{
set ai!
set smartindent
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
"set foldmethod=indent
set shiftwidth=4
set ls=2
syntax on
syntax enable
" }}}

" Keymap {{{
let mapleader=","
let g:mapleader=","
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabn<cr>
map <leader>tk :tabp<cr>
map <leader>tn :tabn<cr>
map <leader>tp :tabp<cr>
map <leader>tc :tabc<cr>
map <leader>tt :tabnew<cr>

" 移动分割窗口
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l 

" Tab navigation like Firefox.
"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i

nnoremap <C-PageUp> :tabprevious<CR>
nnoremap <C-PageDown>   :tabnext<CR>
inoremap <C-PageUp> <Esc>:tabprevious<CR>i
inoremap <C-PageDown>   <Esc>:tabnext<CR>i

nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" }}}


" Plug config {{{

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" ultiSnips
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
let g:UltiSnipsExpandTrigger="<tab>"

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" NerdTree
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" 关闭NERDTree快捷键
map <leader>] :NERDTreeToggle<CR>
imap <leader>] <ESC>:NERDTreeToggle<CR>

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
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

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" ctrl p
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" Auto Save
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
let g:auto_save = 1  " enable AutoSave on Vim startup


" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" multi cursor
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" easy align
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
   let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" vim-airline
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" 是否打开tabline
let g:airline#extensions#tabline#enabled = 1

" }}}

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
