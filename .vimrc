runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
set nocompatible

syntax enable
set background=dark
colorscheme solarized
set encoding=utf-8

set laststatus=2
set hidden " allow hidden buffers
set nowrap " don't wrap lines
set tabstop=4 shiftwidth=4 " indentation is always 4 spaces
set shiftround
set smarttab
set expandtab
set backspace=indent,eol,start " allow backspace over everything in insert mode
set hlsearch incsearch smartcase " highlight matches and search as you type
set showmatch

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set nobackup
set noswapfile

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set encoding=utf-8
set fillchars +=stl:\ ,stlnc:\

let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>a :Ack
nmap <leader>b :CommandTBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CommandT<CR>
nmap <leader>T :CommandTFlush<CR>:CommandT<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

let g:ackprg = 'ag --nogroup --column'

if has('autocmd')
    autocmd filetype python set expandtab
    autocmd filetype html,xml set listchars-=tab:>.
endif
