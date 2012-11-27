set nocompatible
call pathogen#infect()

syntax enable
set encoding=utf-8
set laststatus=2
set showcmd
filetype plugin indent on

set hidden " allow hidden buffers
set nowrap " don't wrap lines
set tabstop=4 shiftwidth=4 expandtab " indentation is always 4 spaces
set shiftround
set autoindent
set copyindent
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

if has('autocmd')
    autocmd filetype python set expandtab
    autocmd filetype html,xml set listchars-=tab:>.
endif
