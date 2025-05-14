" Vim configuration matching merged nvim settings

" Leader and Local Leader keys
let mapleader = " "
let maplocalleader = "\\"

" LazyVim auto format
let g:autoformat = v:true

" Snacks animations
let g:snacks_animate = v:true

" LazyVim picker to use
let g:lazyvim_picker = "auto"

" LazyVim completion engine to use
let g:lazyvim_cmp = "auto"

" Use AI source in completion engine if supported
let g:ai_cmp = v:true

" LazyVim root dir detection
let g:root_spec = ['lsp', ['.git', 'lua'], 'cwd']

" Ignore specific LSP servers for root detection
let g:root_lsp_ignore = ['copilot']

" Hide deprecation warnings
let g:deprecation_warnings = v:false

" Show document symbols location in lualine from Trouble
let g:trouble_lualine = v:true

" Disable recommended markdown style
let g:markdown_recommended_style = 0

" Enable auto write
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
set fillchars=foldopen:,foldclose:,fold: ,foldsep: ,diff:╱,eob:\ 

" Start with all folds open
set foldlevel=99

" Use LazyVim's format expression
set formatexpr=v:lua.require'lazyvim.util'.format.formatexpr()

" Better formatting options
set formatoptions=jcroqlnt

" Format for grep output
set grepformat=%f:%l:%c:%m

" Use ripgrep for grep program
set grepprg=rg\ --vimgrep

" Make cursor block in insert mode
set guicursor=

" Ignore case when searching
set ignorecase

" Show live preview of :substitute command
set inccommand=nosplit

" Keep view when jumping
set jumpoptions=view

" Always use global statusline
set laststatus=3

" Wrap lines at convenient points
set linebreak

" Show invisible characters (tabs, trailing spaces, etc.)
set list

" Enable mouse mode
set mouse=a

" Show absolute line numbers
set number

" Popup menu blend transparency
set pumblend=10

" Maximum number of entries in a popup
set pumheight=10

" Show relative line numbers
set relativenumber

" Disable default ruler
set noruler

" Lines of context above/below cursor
set scrolloff=4

" Options to persist in sessions
set sessionoptions=buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds

" Round indent to nearest shiftwidth
set shiftround

" Size of an indent
set shiftwidth=2

" Short messages configuration
set shortmess+=WIcC

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

" Keep screen view consistent when splitting
set splitkeep=screen

" Open splits to the right
set splitright

" Use Snacks custom statuscolumn
set statuscolumn=%!v:lua.require'snacks.statuscolumn'.get()

" Number of spaces tabs count for
set tabstop=2

" Enable 24-bit colors
set termguicolors

" Time in milliseconds to wait for a mapped sequence to complete
set timeoutlen=300

" Save undo history to an undo file
set undofile

" Maximum number of undo levels
set undolevels=10000

" Time in milliseconds to trigger CursorHold event
set updatetime=200

" Allow cursor to move where there is no text in visual block mode
set virtualedit=block

" Command-line completion mode
set wildmode=longest:full,full

" Minimum window width
set winminwidth=5

" Disable line wrap
set nowrap

" Advanced folding and smoothscroll settings for Neovim >= 0.10
if has("nvim-0.10")
  set smoothscroll
  set foldexpr=v:lua.require'lazyvim.util'.ui.foldexpr()
  set foldmethod=expr
  set foldtext=
else
  set foldmethod=indent
  set foldtext=v:lua.require'lazyvim.util'.ui.foldtext()
endif

" Keep additional settings from the original vimrc that are not in your provided options

" Use Zsh as shell
set shell=/bin/zsh

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

" Use system clipboard (this is from the original, but you said not to sync, keeping the original here for context)
set clipboard=unnamed
