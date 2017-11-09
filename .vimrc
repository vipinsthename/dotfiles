set nocompatible              " be iMproved, required
filetype on                   " filetype must be 'on' before setting it 'off'
                              "   otherwise it exits with a bad status and breaks
                              "   git commit.
filetype off                  " required
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:airline_powerline_fonts = 1
let mapleader = "\<Space>"
set mouse=a
set clipboard+=unnamedplus
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, require
Plugin 'VundleVim/Vundle.vim'

" Add nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Theme gruvbox
" Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'

" Split Terminal
Plugin 'mklabs/split-term.vim'

" Add fzf
Plugin 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf

" Add ale
Plugin 'w0rp/ale'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_quit_key='<Esc>'

" Add airline and theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='gruvbox'

" Git plugin
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" Install easymotion
Plugin 'easymotion/vim-easymotion'

" Add rust plugin
Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required

" Set colorscheme
colorscheme gruvbox
set background=dark

" Local dirs (centralize everything)
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" --- history / file handling ---
set history=999                 " Increase history (default = 20)
set undolevels=999              " Moar undo (default=100)
set autoread                    " reload files if changed externally

" --- backup and swap files ---
set nobackup
set nowritebackup
set noswapfile

" --- search / regexp ---
set gdefault                    " RegExp global by default
set magic                       " Enable extended regexes.
set hlsearch                    " highlight searches
set incsearch                   " show the `best match so far' astyped
set ignorecase smartcase        " make searches case-insensitive, unless they

" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
set nostartofline               " Make j/k respect the columns
set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others
set cursorline              	  " Highlight current line
set laststatus=2            	  " Always show status line
set number                  	  " Enable line numbers.
set numberwidth=5           	  " width of numbers line (default on gvim is 4)
set report=0                	  " Show all changes.
set showmode                	  " Show the current mode.
set showcmd                 	  " show partial command on last line of screen.
set showmatch               	  " show matching parenthesis
set splitbelow splitright   	  " how to split new windows.
set title                   	  " Show the filename in the window title bar.

" --- remove sounds effects ---
set noerrorbells
set visualbell

" --- Indentation & Text wrap ---
set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=2               " Tab key results in # spaces
set tabstop=2                   " Tab is # spaces
set shiftwidth=2                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.
set wrap                        " wrap lines
set textwidth=80

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" Mappings
map <C-e> :NERDTreeToggle<CR>
noremap <leader>q :q<CR>
nnoremap <leader>s :w<CR>
nnoremap <C-p> :Files<CR>
inoremap <C-s> <C-c> :w<CR>
map <C-`> :VTerm<CR>

" Normal copy/paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>
