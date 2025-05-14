" Pure Vim-compatible configuration (Neovim features replaced or removed)

" Leader and Local Leader keys
let mapleader = " "
let maplocalleader = "\\"

" Auto write files on certain commands
set autowrite

" Do not sync with system clipboard (important for SSH compatibility)
set clipboard=

" Completion options
set completeopt=menu,menuone,noselect

" Hide * markup for bold and italic, but not markers with substitutions
set conceallevel=2

" Confirm to save changes before exiting modified buffer
set confirm

" Highlight the current line
set cursorline

" Use spaces instead of tabs
set expandtab

" Characters used to display folds, end of buffer, etc.
set fillchars=foldopen:.,foldclose:.,fold: ,foldsep: ,diff:.,eob:\ 

" Start with all folds open
set foldlevel=99

" Use indentation as fold method (Lua foldexpr removed)
set foldmethod=indent

" Custom fold text (fallback, since Lua unavailable)
set foldtext=foldtext()

" Better formatting options
set formatoptions=jcroqlnt

" Format for grep output
set grepformat=%f:%l:%c:%m

" Use ripgrep if available, fallback to grep
if executable('rg')
  set grepprg=rg\ --vimgrep
else
  set grepprg=grep\ -nH\ $*
endif

" Make cursor block in insert mode (fallback behavior, since no guicursor in Vim console mode)
if has("gui_running")
  set guicursor=
endif

" Ignore case when searching
set ignorecase

" Show live preview of :substitute command (not available in Vim, fallback to default behavior)

" Keep view when jumping (not supported, fallback)

" Always use global statusline (not supported, fallback to default statusline)

" Wrap lines at convenient points
set linebreak

" Show invisible characters (tabs, trailing spaces, etc.)
set list

" Enable mouse mode
set mouse=a

" Show absolute line numbers
set number

" Popup menu blend transparency (not supported, ignore)

" Maximum number of entries in a popup
set pumheight=10

" Show relative line numbers
set relativenumber

" Disable default ruler
set noruler

" Lines of context above/below cursor
set scrolloff=4

" Options to persist in sessions
set sessionoptions=buffers,curdir,tabpages,winsize,help,globals,folds

" Round indent to nearest shiftwidth
set shiftround

" Size of an indent
set shiftwidth=2

" Short messages configuration
set shortmess+=WIc

" Do not show mode (since we have a statusline)
set noshowmode

" Columns of context when side scrolling
set sidescrolloff=8

" Always show signcolumn
set signcolumn=yes

" Don't ignore case if search contains uppercase letters
set smartcase

" Insert indents automatically
set smartindent

" Spell check language
set spelllang=en

" Open splits below current window
set splitbelow

" Open splits to the right
set splitright

" Number of spaces tabs count for
set tabstop=2

" Enable 24-bit colors if supported (fallback to best available in Vim)
if has('termguicolors')
  set termguicolors
endif

" Time in milliseconds to wait for a mapped sequence to complete
set timeoutlen=300

" Save undo history to an undo file (only if persistent undo supported)
if has("persistent_undo")
  set undofile
endif

" Maximum number of undo levels
set undolevels=10000

" Time in milliseconds to trigger CursorHold event (fallback to 'updatetime')
set updatetime=200

" Allow cursor to move where there is no text in visual block mode
set virtualedit=block

" Command-line completion mode
set wildmode=longest:full,full

" Minimum window width
set winminwidth=5

" Disable line wrap
set nowrap

" Use Zsh as shell if available
if executable('/bin/zsh')
  set shell=/bin/zsh
endif

" Ignore specific files and folders in file searches
set wildignore+=.git,.DS_Store,*/node_modules/*,*/dist/*

" Enable incremental search
set incsearch

" Allow buffers to be hidden without being saved
set hidden

" Set background to dark
set background=dark

" Improve redraw performance in macros etc.
set ttyfast
set lazyredraw

" Use system clipboard (can be disabled by user preference)
set clipboard=unnamed
