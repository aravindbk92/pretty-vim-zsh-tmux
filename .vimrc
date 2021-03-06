"===============================================================================
" Hotkeys
"===============================================================================
" open/close nerdtree                   Enter
" enable/disable folding (default)      zi
" open folding (default)                zo / Space
" close folding (default)               zc


"===============================================================================
" General
"===============================================================================
" Note: All the color configurations must be set after colorscheme

" Enable mouse
set ttymouse=xterm2 " make it works with tmux
set mouse=a

" Show line number
set number

" Auto read when a file is changed from the outside
set autoread

" Set regex model as magic
set magic

" Show matching brackets
set showmatch

" Set tab to 4 spaces. 
set ts=2            " tab stop
set shiftwidth=2    " shift width
set softtabstop=2
set expandtab
set autoindent

" Hightlight the 80th column
set colorcolumn=80

" Hightlight current line
set cursorline

" Disable word wrapping
set wrap!

" Set horizontal scroll
set sidescroll=4

" Set folding
function! MyFolding()
    if &foldenable == 0
        set foldcolumn=2
        set foldenable
    else
        set foldcolumn=0
        set nofoldenable
    endif
endfunction

set foldmethod=indent
set foldcolumn=0
set foldnestmax=2
set nofoldenable

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Hightlight search results
set hlsearch

" Show matches online when typing searching pattern
set incsearch

" Be smart about cases
set ignorecase
set smartcase

set timeoutlen=1000 ttimeoutlen=10

nnoremap <SPACE> <Nop>
let mapleader=" "

"===============================================================================
" vim-plug
"===============================================================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/bundle')

" Color themes
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'rakr/vim-one'

" Coding
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'

" Editor
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'

" Airline and its color themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline-fonts'

" workflow
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"===============================================================================
" Plugin Settings
"===============================================================================
let g:python_highlight_all = 1

"===============================================================================
" Colorscheme
"===============================================================================

syntax enable
set t_Co=256
set background=dark


" Solarized
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
"colorscheme solarized

" PaperColor
let g:PaperColor_Theme_Options = {
  \   'theme': { 
  \     'default.dark': {
  \       'transparent_background': 1,
  \       'allow_bold': 1,
  \       'allow_italic': 0
  \     }
  \   },
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
colorscheme PaperColor

" Molokaic
"let g:molokai_original = 1
"colorscheme molokai

" One
"set termguicolors
"let g:one_allow_italics = 1 " Enable italic for comments
"colorscheme one

"set background=dark
"colorscheme evening

" If there is trouble showing the background color, uncomment following lines.
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

" Change search highlight color to light yellow
hi Search ctermbg=227
" Change the color of folding rows columns
hi Folded ctermbg=Black ctermfg=147
hi FoldColumn ctermbg=Black ctermfg=147

"high ColorColumn ctermbg=236 guibg=#FFFFFF



"===============================================================================
" Airline
"===============================================================================

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Set airline color theme
" light, one, wombat
let g:airline_theme='powerlineish'

"===============================================================================
" NERDTree
"===============================================================================

" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Exit NERDTree if there is only one window opened in vim
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files
let NETDTreeShowHidden=1

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

"===============================================================================
" Shortcuts
"===============================================================================
" Folding
" 'zi' will inverse foldenable. Reset 'zi' to change foldcolumn as well.
:nnoremap zi :call MyFolding()<CR>

" Use fzf search
:nnoremap <C-P> :Files<CR>

" Nerdtree
:nnoremap <C-T> :NERDTreeToggle<CR><C-w><C-w>
nnoremap <C-F> :NERDTreeFind<CR>

" Editor
nnoremap <silent> <c-_> :let @/ = ""<CR>

" COC
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)