set nocompatible              " required
filetype on                   " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Vim plugin Manager

Plugin 'kien/ctrlp.vim' " CtrlP, fuzzy file finder
Plugin 'scrooloose/nerdtree' " Nerd Tree, file explorer
Plugin 'tpope/vim-fugitive' " Vim fugitive, a git wrapper
Plugin 'airblade/vim-gitgutter' " Shows a git diff in a sign column
Plugin 'tpope/vim-surround' " Surround, parentheses, brackets, quotes, etc.
Plugin 'Raimondi/delimitMate' " Auto-completion for quotes, parens, brackets, etc.
Plugin 'scrooloose/nerdcommenter' " Comments toggle
Plugin 'bling/vim-airline' " Status line
Plugin 'flazz/vim-colorschemes' " Color schemes
Plugin 'vim-scripts/taglist.vim' " Tag list
Plugin 'majutsushi/tagbar' " Browse the tags of the current file
Plugin 'Valloric/YouCompleteMe' " Completion plugin
Plugin 'scrooloose/syntastic' " Syntastic, syntax checker

"Plugin 'nvie/vim-flake8'
"Plugin 'pangloss/vim-javascript'
"Plugin 'hail2u/vim-css3-syntax'
Plugin 'gorodinskiy/vim-coloresque' " Color preview css/less/sass/html
Plugin 'ntpeters/vim-better-whitespace' " Highlights whitespaces
Plugin 'sheerun/vim-polyglot' " Syntax and indent for 70+ languanges
"Plugin 'Yggdroot/indentLine' " Vertical lines to show indent level

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" Enable syntax highlighting
syntax enable

" Color scheme
colorscheme Chasing_Logic

set mouse=a
set clipboard=unnamedplus

" Lines to save in history
set history=800

" Turn off VIM backup
set nobackup
set nowb
set noswapfile

" Show always the cursor's position
set ruler

" Show always the status line
set laststatus=2

" Show line numbers
set number

" Linebreak
set lbr
set cc=80
set tw=80
set wrap

" Ignore case and highlight when searching
set ignorecase
set hlsearch

" Auto indent and smart indent
set ai
set si

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Show existing tab with 4 spaces width
set tabstop=4
set softtabstop=4

" On pressing tab, insert 4 spaces
set expandtab
set smarttab

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Mappings
silent! map <F3> :NERDTreeToggle<CR>
silent! map <F4> :SyntasticToggleMode<CR>
silent! nmap <F8> :TagbarToggle<CR>

" CtrlP config
let g:ctrlp_working_path_mode=0

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Restores the cursor position
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup  resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
