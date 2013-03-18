scriptencoding utf-8
set encoding=utf-8

" enable pathogen on start up
call pathogen#runtime_append_all_bundles()
call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL PARAMS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax highlighting
syntax on
" enable file type detection.
filetype plugin indent on
" highlight the current line
set cursorline
" show line numbers
set number
" always show status line
set ls=2
" highlight trailing space
set list listchars=trail:·,tab:·�
" number of spaces for tab character
set tabstop=2
" number of spaces to autoindent
set shiftwidth=2
" convert tabs to spaces
set expandtab
" display incomplete commands
set showcmd
" highlight search
set hlsearch
" ignore case while searching
set ignorecase
" incremental search
set incsearch
" don't need any backups
set nobackup
set nowritebackup
set noswapfile
" leader mapped to '
let mapleader= "'"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=light
set t_Co=256
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
"needed for the powerline:
let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <c-c> instead of ESC. Of course.
map <c-c> <esc>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <Space> :nohlsearch<cr>
endfunction
call MapCR()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLD JAVASCRIPT AUTOMATICALLY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=syntax
let javaScript_fold=1         " JavaScript
hi Folded term=bold cterm=bold
set fillchars="fold:"


