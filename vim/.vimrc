" Leader keys
let mapleader = " "
let maplocalleader = "\\"

" Autoformatting (custom usage, no direct equivalent in plain Vim)
let g:autoformat = 1

" Snacks animations (hypothetical global variable)
let g:snacks_animate = 1

" Picker selection - not applicable directly, could integrate fzf.vim
" TODO: is this and some others can be ported to vim ?
let g:lazyvim_picker = "auto"

" Completion engine - not applicable directly
let g:lazyvim_cmp = "auto"

" AI source preference (only with specific AI plugins)
let g:ai_cmp = 1

" Root detection - no native equivalent, external plugin like 'vim-rooter' can help
" You can mimic it by using:
let g:root_spec = ['.git', 'lua']

" LSP ignore (manual management, no direct Vim equivalent)
let g:root_lsp_ignore = ['copilot']

" Deprecation warnings
let g:deprecation_warnings = 0

" Trouble in lualine - not applicable, but you could use 'vim-airline' + 'vim-trouble'
let g:trouble_lualine = 1

" Basic Options
set autowrite
if !has("nvim")
  set clipboard=unnamedplus
endif
set completeopt=menu,menuone,noselect
set conceallevel=2
set confirm
set cursorline
set expandtab
set foldlevel=99
set formatoptions=jcroqlnt
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep
set ignorecase
set inccommand=nosplit
set laststatus=2
set linebreak
set list
set mouse=a
set number
set pumheight=10
set relativenumber
set scrolloff=4
set shiftround
set shiftwidth=2
set showmode
set sidescrolloff=8
set signcolumn=yes
set smartcase
set smartindent
set spelllang=en
set splitbelow
set splitright
set tabstop=2
set termguicolors
set timeoutlen=300
set undofile
set undolevels=10000
set updatetime=200
set virtualedit=block
set wildmode=longest:full,full
set winminwidth=5
set wrap!

" Short messages
set shortmess+=W
set shortmess+=I
set shortmess+=c
set shortmess+=C

" Disable markdown recommended style
let g:markdown_recommended_style = 0

" Fill characters (custom Unicode characters for folds etc.)
set fillchars=foldopen:,foldclose:,fold:\ ,foldsep:\ ,diff:╱,eob:\ 

" Folds - fallback to indent method since Lua expressions won't work
set foldmethod=indent
set foldtext=v:lua.require'lazyvim.util'.ui.foldtext() " No direct Vim support, use default or a plugin

" Statuscolumn is not supported in Vim, skip it or use 'signcolumn'

" Session options
set sessionoptions=buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds

" Terminal setup: if you want PowerShell, you can set manually (for Windows)
" set shell=pwsh

" Grep program (using ripgrep)
if executable('rg')
  set grepprg=rg\ --vimgrep
endif
