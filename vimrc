" {{{ Vim-Plug 
" https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'junegunn/vim-easy-align'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'vim-scripts/vim-auto-save'
    Plug 'mbbill/undotree'
    Plug 'tomtom/tcomment_vim'
    Plug 'dkprice/vim-easygrep'
    Plug 'vim-scripts/mru.vim'
call plug#end()
" }}} Vim-Plug  

" {{{ encoding
" 设置编码
let &termencoding=&encoding
set fileencodings=ucs-bom,utf-8,cp936
set renderoptions=type:directx
set encoding=utf-8
language messages zh_CN.utf-8 " solve console messy code
" }}} encoding

" {{{ General 
set title
set nocompatible   
set nobackup
set nowritebackup
set noswapfile
set history=2048
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
set guicursor+=n-v-c:blinkon0
" }}} General 


" {{{ GUI 
set shortmess=atI

"窗口设置
if has("gui_running")
    set background=dark
    color solarized
    " https://github.com/hbin/top-programming-fonts
    "set guifont=Monaco\ 13
    set guifont=monaco:h13

    " shift+F2: Toggle Menu and Toolbar
    set guioptions-=m     " 隐藏菜单栏
    set guioptions-=T      " 隐藏工具栏
    map <silent> <S-F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <bar>
        \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
        \endif<CR>

    "au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    winpos 200 100            " 指定窗口出现的位置，坐标原点在屏幕左上角
    set lines=48 columns=166 " 指定窗口大小，lines为高度，columns为宽度
    set showtabline=2       " 显示Tab栏
    set guitablabel=%t        "标签只显示名称"
    set tabpagemax=20
    set guioptions-=L       " 隐藏左侧滚动条
    "set guioptions-=r       " 隐藏右侧滚动条
    set guioptions-=b       " 隐藏底部滚动条
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
" }}} GUI 


" {{{ Format 
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
" }}} Format 


" {{{ Keymap 
let mapleader=","
let g:mapleader=","
" 移动分割窗口
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l 
" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
nnoremap <C-PageUp> :tabprevious<CR>
nnoremap <C-PageDown>   :tabnext<CR>
inoremap <C-PageUp> <Esc>:tabprevious<CR>i
inoremap <C-PageDown>   <Esc>:tabnext<CR>i
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
map <M-k> :tabnext<CR>
map <M-j> :tabpre<CR>
imap <M-k> <ESC>:tabnext<CR>i
imap <M-j> <ESC>:tabpre<CR>i
map <M-w> :q<CR>
imap <M-w> <ESC>:q<CR>
"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
"取消高亮
map <F6> :nohlsearch<CR>    
imap <F6> <ESC>:nohlsearch<CR>
" }}} Keymap 


" {{{ PlugConfig 
" ---------------------------------
" NerdTree
" ---------------------------------
" 关闭NERDTree快捷键
map <M-,> :NERDTreeToggle<CR>
imap <M-,> <ESC>:NERDTreeToggle<CR>
map <Leader>, :NERDTreeToggle<CR>
imap <Leader>, <ESC>:NERDTreeToggle<CR>

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

" ---------------------------------
" easy align
" ---------------------------------
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
       let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups':['String'] }

" ---------------------------------
" vim-airline
" ---------------------------------
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline#extensions#tabline#enabled = 1

" ---------------------------------
" Auto Save
" ---------------------------------
let g:auto_save = 1
let g:auto_save_silent = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0


" ---------------------------------
"  undo tree
" ---------------------------------
if has("persistent_undo")
set undodir=~/.undodir/
    set undofile
endif

" ---------------------------------
" mru
" ---------------------------------
map <M-;> <ESC>:MRU<CR>
imap <M-;> <ESC>:MRU<CR>
map <Leader>; <ESC>:MRU<CR>
imap <Leader>; <ESC>:MRU<CR>
" }}} PlugConfig 


" {{{ Other
" 读文件时自动设定当前目录为刚读入文件所在的目录
autocmd BufReadPost * cd %:p:h

" 恢复上次阅读现场,上次读到哪了
autocmd BufWinLeave * if expand('%') != '' && &buftype == '' | mkview | endif
autocmd BufRead     * if expand('%') != '' && &buftype == '' | silent loadview| syntax on | endif
 
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
" }}} Other
