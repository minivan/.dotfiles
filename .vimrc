
" enable pathogen on start up
call pathogen#runtime_append_all_bundles()

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
  nnoremap <cr> :nohlsearch<cr>
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
" SWITCH BETWEEN CUCUMBER SPEC AND STEP DEFINITION FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenCukeAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file = expand('%')
  let new_file = current_file
  let in_feature = match(current_file, '\.feature$') != -1

  if in_feature
    let new_file = substitute(new_file, '\.feature$', '_steps\.rb','')
    echo "Will try to open the cucumber steps located in file " . new_file
  else
    let new_file = substitute(new_file, '/step_definitions', '','')
    let new_file = substitute(new_file, '_steps', '','')
    let new_file = substitute(new_file, '_steps\.rb', '\.feature','')
    echo "Will try to open the cucumber feature file called " . new_file
  endif
  return new_file
endfunction
map <leader>t :call OpenCukeAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-rspec bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>r :RunSpec<cr>
map <leader>l :RunSpecLine<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" focus mode
""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>

