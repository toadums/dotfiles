set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Vundle help
""""""""""""""
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles


" VCS
Plugin 'tpope/vim-fugitive'

" System
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'luochen1990/rainbow'
Plugin 'kien/ctrlp.vim'
Plugin 'wincent/command-t'
Plugin 'Shougo/neocomplete.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'kristijanhusak/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/gitignore'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ajh17/Spacegray.vim'

" Syntaxes
Plugin 'leshill/vim-json'
Plugin 'othree/html5.vim'
Plugin 'itspriddle/vim-jquery'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'honza/vim-snippets'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'

" Fun, but not useful
Plugin 'skammer/vim-css-color'

call vundle#end()

" Requiredn after vundle plugin definitions
filetype plugin indent on

" Change leader
let mapleader = ","
let g:mapleader = ","

" Wildmenu
set wildmenu
set wildmode=list:longest
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
" Ignore in buffer explorer
let g:netrw_liststyle= 1 " Tree-mode
let g:netrw_list_hide= '.*\.swp$,.*/$'

let g:yankring_replace_n_nkey = "<C-S-P>"
set autochdir

" Save when losing focus
set autowriteall " Auto-save files when switching buffers or leaving vim.
au FocusLost * silent! :wa
au TabLeave * silent! :wa

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
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "  case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set guifont=Inconsolata\ for\ Powerline:h13
set relativenumber

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
endif

" Default background & theme
syntax enable
set background=dark
colorscheme spacegray

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:·

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

" General Code Folding
set foldmethod=indent
set foldlevel=99

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
nnoremap / /\v
vnoremap / /\v

" Toggle spellcheck in normal mode
:map <F5> :setlocal spell! spelllang=en_us<CR>

" Markdown configurations
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Ruby Configurations
autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2

" HTML configurations
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Javascript configurations
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab

" Ensure that JSON files have their filetype properly set.
au BufRead,BufNewFile *.json set filetype=json

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null


" Plugin Configurations
"""""""""""""""""""""""

" crtl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'  " search anything (in files, buffers and MRU files at the same time.)
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_root_markers = ['.git']
"let g:ctrlp_working_path_mode = 'ra' " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 1 " show the match window at the top of the screen
let g:ctrlp_max_height = 40 " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
let g:ctrlp_clear_cache_on_exit=0 " speed up by not removing clearing cache evertime
let g:ctrlp_show_hidden = 0 " don't show me dotfiles
let g:ctrlp_mruf_max = 250 " number of recently opened files

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Double rainbow - What does it mean!?
let g:rainbow_active = 1

set laststatus=2
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_puppet_lint_disable = 0

" Airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" AIRLINE
let g:airline_theme             = 'base16'
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

let g:neocomplete#enable_at_startup = 1

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

nnoremap <C-/> <leader>c<space>
nnoremap J :bp<CR>
nnoremap K :bn<CR>

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

nnoremap <Tab> >>
nnoremap <S-Tab> <<

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

map <leader>ca :1,1000 bd<cr>
nmap <leader>t :CtrlP<CR>

nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <leader><space> :noh<cr>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap ; :
nnoremap <leader>s :Ag<Space>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap ys :YRShow<CR>
vnoremap ys <ESC>:YRShow<CR>
nnoremap <leader>d yyp$




