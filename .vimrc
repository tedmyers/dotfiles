set nocompatible              " be iMproved, required
syntax on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'	" Helpful for Git commands
Plugin 'scrooloose/nerdtree' " NERDTree
Plugin 'ctrlpvim/ctrlp.vim' " Ctrl P
Plugin 'vim-airline/vim-airline' " nice status/tabline
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/calendar-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" map Shift-Enter as escape
"nnoremap <S-cr> <esc>
"vnoremap <S-cr> <esc>
"xnoremap <S-cr> <esc>
"inoremap <S-cr> <esc>
"onoremap <S-cr> <esc>
"cnoremap <S-cr> <esc>

" basic options
set autoindent                 "use indentation of previous line
set showcmd                    "show the last ex command
set laststatus=2               "Always display the statusline in all windows
set hidden                     "hide buffers, don't abandon them
set visualbell                 "use visual cue for error
set ttyfast                    "improve screen redrawing
set undofile                   "save undo history to file
set lazyredraw                 "save some computational power
set splitbelow                 "default split behavior
set splitright                 "default split behavior
set autoread                   "reread files that changed outside vim
set autowrite                  "auto save when moving away via ^], fe
set autowriteall               "same, but for :edit and family
set title                      "use a title
set ignorecase smartcase       "use smart case searching
set cursorline                 "highlight the current line
set whichwrap=                 "no keys can wrap lines in normal/visual
set hlsearch incsearch         "highlight as we go
set history=1000               "keep a longer ex history
set undoreload=1000            "keep a longer undo history
set backspace=indent,eol,start "let insert mode backspace be useful
" set showbreak=↪                "put at the start of wrapped lines
set colorcolumn=+1             "highilight the column after the textwidth value
set nrformats=octal,hex,alpha  "make ^x and ^a intelligent
set scrolloff=10               "keep at least 10 lines above/below cursor
set virtualedit=block          "Let block visual go past EOL
set nolist                     "show special chars (below)
set foldmethod=syntax          "use syntax folding by default
set number                     "enable line numbers by default
set list
set listchars=tab:>-
set encoding=utf-8
set clipboard=unnamedplus      "yank to system clipboard


let mapleader = ","            " Set leader

" Color scheme
set background=dark
colorscheme desert

" Text wrapping
set wrap
set textwidth=110

" Back ups
set backup                       " enable backups
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Start NERDTree when vim starts, even with no files
 autocmd vimenter * NERDTree
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1        "Show hidden files by default
let NERDTreeDirArrows=1         "Use fancy characters
let NERDTreeAutoDeleteBuffer=1  "Delete buffers invalidate by move/rename/delete
let NERDTreeRespectWildIgnore=0 "Respect wildignore settings


" vimwiki stuff "
" Run multiple wikis "
let g:vimwiki_list = [
 \{'path': '~/Documents/VimWiki/personal.wiki'},
 \{'path': '~/Documents/VimWiki/tech.wiki'}
 \]
au BufRead,BufNewFile *.wiki set filetype=vimwiki
 :autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote
 function! ToggleCalendar()
   execute ":Calendar"
   if exists("g:calendar_open")
     if g:calendar_open == 1
       execute "q"
       unlet g:calendar_open
     else
       g:calendar_open = 1
     end
   else
    let g:calendar_open = 1
   end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()
