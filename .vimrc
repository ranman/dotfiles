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

if has('autocmd')
    autocmd filetype python set expandtab
    autocmd filetype html,xml set listchars-=tab:>.
endif
