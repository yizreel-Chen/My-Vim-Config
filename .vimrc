"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"        __  __        __     ___
"       |  \/  |_   _  \ \   / (_)_ __ ___  _ __ ___
"       | |\/| | | | |  \ \ / /| | '_ ` _ \| '__/ __|
"       | |  | | |_| |   \ V / | | | | | | | | | (__
"       |_|  |_|\__, |    \_/  |_|_| |_| |_|_|  \___|
"               |___/
"       https://github.com/ChenYi-qy/My-Vim-Config/        
"                      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'morhetz/gruvbox' 
  Plug 'tpope/vim-surround'
  Plug 'plasticboy/vim-markdown'


call plug#end()
" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set the backslash as the leader key.
let mapleader = '\'  

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert/common/visual mode quickly.
inoremap jj <Esc>
cnoremap jj <Esc>  
vnoremap jj <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme gruvbox 


    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the left-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" }}}

" BASIC SETTINGS --------------------------------------------------------------- {{{

" To use Latex formula
let g:vim_markdown_math=1

" To use markdown preview
let vim_markdown_preview_github=1

" Set vim theme(make sure to let below commands underneth the Plugins settings)
colorscheme gruvbox
set background=dark

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to the file.
set number

" Add relative numbers to the file
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" STATUS LINE ------------------------------------------------------------ {{{
    " Set colors for the status line.
    hi User0 ctermbg=black ctermfg=yellow guibg=black guifg=yellow gui=bold
    hi User1 ctermbg=blue ctermfg=black guibg=white guifg=blue gui=bold

    " Clear status line when vimrc is reloaded.
    set statusline=

    " White on blue.
    set statusline+=%0*

    " Full path to the file.
    set statusline+=\ %F

    " Modified flag.
    set statusline+=\ %M

    " Blue on white.
    set statusline+=\ %1*

    " File type.
    set statusline+=\ %Y

    " Read only.
    set statusline+=\ %R

    " White on blue.
    set statusline+=\ %0*

    " Show the buffer number
    set statusline+=\ buff:\ %n

    " Blue on white.
    set statusline+=\ %1*

    " Ascii.
    set statusline+=\ %b

    " White on blue.
    set statusline+=\ %0*

    " Hex.
    set statusline+=\ 0x%B

    " Blue on white.
    set statusline+=\ %1*

    " Color.
    set statusline+=%#warningmsg#

    set statusline+=%*

    " Blue on white.
    set statusline+=%1*

    " Split the left from the right.
    set statusline+=%=

    " White on blue.
    set statusline+=\ %0*

    " Show the total number of lines in the file.
    set statusline+=\ lines:\ %L
     
    " Blue on white.
    set statusline+=\ %1*

    " Show the row the cursor is on.
    set statusline+=\ row:\ %l

    " Blue on white.
    set statusline+=\ %0*

    " Show the column the cursor is on.
    set statusline+=\ col:\ %c
     
    " Blue on white.
    set statusline+=\ %1*

    " Show the lenth of the line.
    set statusline+=\ percent:\ %p%%
     
    " White on blue.
    set statusline+=\ %0*

    " Show the status on the second to last line.
    set laststatus=2

    " }}}

