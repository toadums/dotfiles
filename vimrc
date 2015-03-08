set encoding=utf-8
set nocompatible

call plug#begin('~/.vim/plugged')

" VCS
Plug 'tpope/vim-fugitive'

" System
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'ajh17/VimCompletesMe'
Plug 'tpope/vim-dispatch'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/YankRing.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'

" Syntaxes
Plug 'othree/html5.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'coffee', 'haml']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'coffee', 'haml']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['scss', 'sass', 'haml']}

" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rbenv', {'for': 'ruby'}
Plug 'tpope/vim-bundler', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}

" Themes
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()

"rspec + dispatach
let g:rspec_command = "Dispatch rspec {spec}"

" Change leader
nnoremap <SPACE> <Nop>
let mapleader = " "
let g:mapleader = " "

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=**.class                          " Cursed Java class files
set wildignore+=bower_components
set wildignore+=node_modules
set wildignore+=vendor/bundle
set wildignore+=public

" Ignore in buffer explorer
let g:netrw_altfile = 1
let g:netrw_liststyle= 1
cabbrev E Explore

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Basics
set number        " always show line numbers
set hidden        " Allow un-saved buffers in background
set clipboard=unnamed " Share system clipboard.
set backspace=indent,eol,start " Make backspace behave normally.
set directory=/tmp// " swap files
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac "Default file types
set nowrap        " don't wrap lines
set showmatch     " set show matching parenthesis
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set visualbell           " don't beep
set noerrorbells         " don't beep
set cursorline
set cc=80

" Default background & theme
syntax enable
set background=dark
colorscheme tomorrow-night-eighties

" Default Tabs & spaces
set tabstop=2     " a tab is four spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
nnoremap / /\v
vnoremap / /\v

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Hide scrollbars
set guioptions=Ace

" Plugin Configurations
"""""""""""""""""""""""

runtime macros/matchit.vim
if has("autocmd")
  filetype indent plugin on
  autocmd BufRead,BufNewFile *.arb setfiletype ruby
  autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
endif

let g:ctrlp_match_window = 'bottom,max:40'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_user_command = 'ag %s -l -g ""'

set laststatus=2
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" Airline configs
" let g:airline#extensions#tabline#enabled = 1 " Show or hide buffers at top
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" AIRLINE
let g:airline_theme             = 'tomorrow'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

" vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_branch_prefix     = '⭠'
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = '⭡'


" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Plugin Configurations
"""""""""""""""""""""""
" keybindings for easier switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <C-s> :w<CR>
vnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Leader maps
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRU<CR>

nnoremap <leader><space> :noh<cr>
nnoremap <leader>s :Ag<Space>
nnoremap <leader>ra :Dispatch bundle exec rspec %<CR>
nnoremap <leader>rn :Dispatch bundle exec rspec %:
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>c  :ccl<CR>

