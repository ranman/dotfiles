"
" .vimrc
"
" Vim configuration resource file.  Specifies desired
" behavior for the vim editor.
"

"
" Do some magic to get vim to do colors for terminal
" type 'xterm'.  Note these contain control characters.
"
if &term =~ "xterm"
    if has("terminfo")
        set t_Co=8
        set t_Sf=[3%p1%dm
        set t_Sb=[4%p1%dm
    else
        set t_Co=8
        set t_Sf=[3%dm
        set t_Sb=[4%dm
    endif
endif
filetype on
filetype plugin on
:set nu
:set modeline          " Tell vim to look for a line in the file to
                       "     override settings (like tab stops)
:set showmode          " Tell you if you're in insert mode
:set tabstop=4         " Set the tabstop to 4 spaces
:set shiftwidth=4      " Shiftwidth should match tabstop
:set expandtab         " Convert tabs to <tabstop> number of spaces
:set nowrap            " Do not wrap lines longer than the window
:set nowrapscan        " Do not wrap to the top of the file while searching
:set ruler             " Show the cursor position all the time
:set smartindent       " Let vim help you with your code indention
:set autoindent        " turn on autoindent 
:set smarttab          " turn on smarttab
:set nohlsearch        " Don't highlight strings you're searching for
:set formatoptions+=ro " Automatically insert the comment character when
                       "     you hit <enter> (r) or o/O (o) in a block comment
:set backspace=2       " Makes backspace work like you expect
:set report=0          " When doing substitutions, report the number of changes
:set background=dark   " Tell vim my background color is dark, so set
                       "     the colors appropriately
:set wildmenu          " Show menu on double-tab command completion
:set wildmode=list:longest,full " Control how 'wildmenu' things are listed
":set colorcolumn=80    " Highlight the 80th column -- help prevent long lines 

"Make spacebar clear status
nnoremap <silent> <Space> :silent noh<Bar>echo<CR> 

"Make enter work like you expect.
:map <S-Enter>  O<ESC>
:map <Enter>    o<ESC>
:cmap w!! %!sudo tee > /dev/null %
:ab #b /*********************************************************************
:ab #e *********************************************************************/ 
"
" Switch syntax highlighting on, when the terminal can support colors
"
if &t_Co > 2 || has("gui_running")
    :syntax on
    "
    " Change the highlight color for Comment and Special
    " to Cyan.  Blue is too dark for a black background.
    "
    :highlight Comment  term=bold ctermfg=cyan guifg=cyan
    :highlight Special  term=bold ctermfg=cyan guifg=cyan
    :highlight Constant term=bold ctermfg=red  guifg=cyan
endif
:set background=dark

if has("autocmd")
" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
    au BufNewFile,BufRead [Mm]akefile* set noexpandtab

" Make vim recognize a file ending in ".template" be a C++ source file
    au BufNewFile,BufRead *.template set filetype=cpp

" Make vim use 8 character tabstops and recognize # as a start-of-comment token
" in assembly source files
    au BufNewFile,BufRead *.s set tabstop=8 noexpandtab | 
                                syn match asmComment "#"

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
" Make vim wrap e-mail text at 75 characters
    au FileType mail set textwidth=75
" For dealing with Haskell files:
    au BufNewFile,BufRead *.hs compiler ghc | set expandtab
" For dealing with taskr files:
    au BufNewFile,BufRead *.taskr setf taskr
endif

" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
