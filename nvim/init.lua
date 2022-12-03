local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- VCS
Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/plenary.nvim' -- Common utilities
Plug 'onsails/lspkind-nvim' -- vscode-like pictograms
Plug 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp' -- Completion
Plug 'neovim/nvim-lspconfig' -- LSP
Plug 'jose-elias-alvarez/null-ls.nvim' -- Plug Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'windwp/nvim-autopairs'

-- System

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'christoomey/vim-tmux-navigator'

Plug 'sickill/vim-pasta'
Plug 'roman/golden-ratio'

-- Theme
Plug 'EdenEast/nightfox.nvim'

vim.call('plug#end')


vim.o.termguicolors = true
vim.cmd("colorscheme nightfox")

vim.cmd([[
  " syntax on
  " set termguicolors
  " set background=light 
  " colorscheme neon

  nnoremap <SPACE> <Nop>
  let mapleader = " "
  let g:mapleader = " "

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="

  " Basics
  set relativenumber                      " always show line numbers
  set number                              " Show the currently line number
  set hidden                              " Allow un-saved buffers in background
  set clipboard=unnamed                   " Share system clipboard.
  set backspace=indent,eol,start          " Make backspace behave normally.
  set backupskip=/tmp/*,/private/tmp/*
  set backupdir=/tmp/
  set directory=/tmp/                     " swap files
  set ffs=unix,dos,mac                    " Default file types
  set nowrap                              " don't wrap lines
  set showmatch                           " set show matching parenthesis
  set hlsearch                            " highlight search terms
  set incsearch                           " show search matches as you type
  set history=1000                        " remember more commands and search history
  set undolevels=1000                     " use many muchos levels of undo
  set visualbell                          " don't beep
  set noerrorbells                        " don't beep
  set wildcharm=<Tab>
  set splitright

  " Default Tabs & spaces
  set tabstop=2     " a tab is two spaces
  set shiftwidth=2  " number of spaces to use for autoindenting
  set softtabstop=2
  set expandtab
  set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
  set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
  set autoindent    " always set autoindenting on
  set copyindent    " copy the previous indentation on autoindenting
  set cursorline    " highlight current line
  set colorcolumn=100


  " Hide scrollbars
  set guioptions=Ace

  " Key Bindings
  """""""""""""""""""""""

  "make < > shifts keep selection
  vnoremap < <gv
  vnoremap > >gv

  nnoremap <leader>q :q<CR>

  " Open files
  nnoremap <leader>d :vsp %:h/<Tab>
  nnoremap <leader>e :e %:h/<Tab>

  nnoremap <leader><space> :noh<cr>
  vnoremap <leader><space> <esc>:noh<cr>

  nnoremap - :Explore<cr><cr>

  nnoremap <leader>s  :w<CR>

  cnoremap jk <ESC>
  inoremap jk <ESC>

  " Open vimrc in a split
  nnoremap <leader>v :vsp ~/.vimrc<CR>

	" when in netrw in tmux-navigator <c-l> won't move you right as it tries to
	" refresh netrw instead. This overrides that so we can <c-l> to our hearts
	" content
	augroup netrw_mapping
	  autocmd!
	  autocmd filetype netrw call NetrwMapping()
	augroup END

	function! NetrwMapping()
	  nnoremap <silent> <buffer> <c-l> :TmuxNavigateRight<CR>
	endfunction

]])
