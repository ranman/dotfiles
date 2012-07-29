call pathogen#infect()
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans = 1

noremap <leader>y "*y
noremap <leader>yy "*Y
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

set clipboard=unnamed
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

if has ("autocmd")
	filetype on
	filetype indent on
	filetype plugin on
endif

