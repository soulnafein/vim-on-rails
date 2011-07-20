"VIM on Rails

"""""""""""""""""""""""""""""""""""""""
" Use Vundle for plugin management
"""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""
Bundle "L9"
Bundle "FuzzyFinder"
Bundle "mileszs/ack.vim"
Bundle "altercation/vim-colors-solarized"
Bundle "http://conque.googlecode.com/files/conque_1.1.tar.gz"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"
Bundle "tpope/vim-haml"
Bundle "michaeljsmith/vim-indent-object"
Bundle "pangloss/vim-javascript"
Bundle "wycats/nerdtree"
Bundle "ddollar/nerdcommenter"
Bundle "tpope/vim-surround"
Bundle "Townk/vim-autoclose"
Bundle "vim-scripts/taglist.vim"
Bundle "ervandew/supertab"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-rails"
Bundle "taq/vim-rspec"
Bundle "vim-scripts/ZoomWin"
Bundle "msanders/snipmate.vim"
Bundle "tpope/vim-unimpaired"
Bundle "tpope/vim-endwise"
Bundle "kchmck/vim-coffee-script"
Bundle "scrooloose/syntastic"
Bundle "matchit.zip"
Bundle "ecomba/vim-ruby-refactoring"
Bundle "danchoi/ri_vim"

"""""""""""""""""""""""""""""""""""""
" General configuration
"""""""""""""""""""""""""""""""""""""
set nocompatible

set number
set ruler
syntax on
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""
" Whitespace
"""""""""""""""""""""""""""""""""""""""
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""""
" Tab completion
""""""""""""""""""""""""""""""""""""""
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

"""""""""""""""""""""""""""""""""""""
" Status bar
"""""""""""""""""""""""""""""""""""""
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZoomWin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

"""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration
"""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

"""""""""""""""""""""""""""""""""""""""""""""""
" CTags configuration
"""""""""""""""""""""""""""""""""""""""""""""""

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on


" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
silent! color solarized
set background=dark

" Directories for swp files
set backupdir=~/.vim/swaps
set directory=~/.vim/swaps

" Show (partial) command in the status line
set showcmd

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


"""""""""""""""""""""""""""""""""""""""""""
" KEYMAPS
"""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader><Leader> :ZoomWin<CR>
map <C-\> :tnext<CR>
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
map <C-N> :FufCoverageFile<CR>
map <A-N> :FufBuffer<CR>
imap <C-SPACE> <C-p>
imap <C-A-SPACE> <C-x><C-]>
map <C-s> :w<CR>
map <C-A-s> :wall<CR>

"""""""""""""""""""""""""""""""""""""""""""
" AUTOSAVE
"""""""""""""""""""""""""""""""""""""""""""
autocmd FocusLost * :wall
