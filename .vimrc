set nocompatible
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Manage bundles
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'othree/yajs.vim'
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'
Plugin 'tpope/vim-abolish.git'
Plugin 'groenewege/vim-less'
Plugin 'jiangmiao/auto-pairs'
Bundle 'mxw/vim-jsx'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chrisbra/csv.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'maxbrunsfeld/vim-yankstack'


call vundle#end()

"fix lag
set lazyredraw

" Load the plugin and indent settings for the detected filetype
set autoindent
"filetype plugin indent on
filetype plugin on

" Misc
let mapleader=","      "Set the best leader
set encoding=utf-8     "Set encoding
set hidden             "Better buffer behavior
set autoread           "Automatically pick up changes from disk

" Look and feel
set number
set ruler
syntax on
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

set laststatus=2       " Status bar

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·

" Remove all trailing whitespace
autocmd FileType c,cpp,php,rb,py,js autocmd BufWritePre * :%s/\s\+$//e

" Color column 81
"set colorcolumn=81
set cursorline

" Smoother scrolling
set scrolloff=3
nnoremap <Space> <C-d>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Yanks go to clipboard
set clipboard+=unnamed

" copy from/to clipboard
noremap <Leader>y "*y
:noremap <Leader>p "*p

" vim-yankstack shortcuts (mac only)
nmap π <Plug>yankstack_substitute_older_paste
nmap ∏ <Plug>yankstack_substitute_newer_paste
"nmap <leader>p <Plug>yankstack_substitute_older_paste
"nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Show (partial) command in the status line
set showcmd

" Escaping from insert mode
inoremap jj <ESC>

" NERDTree configuration
map <Leader>t :NERDTreeToggle<CR>

" CtrlP configuration
map <Leader>n :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>

" JSX sintax
let g:jsx_ext_required = 0

" Go config
autocmd Filetype go setlocal noexpandtab

" Comments
":imap <Leader>cc //-----------------------------<CR>//  <C-O>mz<CR>//-----------------------------<C-O>`z
:imap <Leader>cc //-----------------------------<CR>  <C-O>mz<CR>-----------------------------<C-O>`z

"Camel Case motion Plugin settings
call camelcasemotion#CreateMotionMappings('<leader>')

" Save all
" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon
" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon
noremap <C-s> :wa<CR>
vnoremap <C-s> <C-C>:wa<CR>
inoremap <C-s> <C-O>:wa<CR>

" quit all
noremap <C-q> :qa<CR>
vnoremap <C-q> <C-C>:qa<CR>
inoremap <C-q> <C-O>:qa<CR>


" scroll to next buffer
map <C-h> :bprev<CR>

" scroll to previous buffer
map <C-l> :bnext<CR>


" replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>"

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" No idea of what this is
inoremap <C-;> <C-O>$A;

" Consider .json like .js file
autocmd BufNewFile,BufRead *.json set ft=javascript

" Open NERDTREE at startup
" au VimEnter *  NERDTree
" autocmd BufWinEnter * NERDTreeMirror
