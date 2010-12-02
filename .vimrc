" This must be first, because it changes other options as side effect
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Ack shortcut
nnoremap <leader>a :Ack

" Remove trailing whitespace in whole file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Format paragraph
nnoremap <leader>q gqip

" Create vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

set hidden
set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set expandtab     " soft tabs
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

if has("gui_running")
  set fuoptions=maxvert,maxhorz
end

filetype plugin indent on
if has('autocmd')
  autocmd filetype python set expandtab
  autocmd filetype html,xml set listchars-=tab:>.
end

if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running") " switch syntax highlighting on, when the terminal has colors
  syntax on
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F2>

set completeopt=longest,menu
set wildmode=list:longest,list:full
set wildignore=*.swp,*.bak
set complete=.,t
set ofu=syntaxcomplete#Complete
set paste

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Turn off arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile = expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks = 1
let NERDTreeShowFiles = 1
let NERDTreeShowHidden = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 2
