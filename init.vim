set shell=/bin/bash

let g:python_host_prog = "/usr/local/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"

call plug#begin('~/.vim/plugged')

" Bundles
Plug 'Raimondi/delimitMate'
  " Expand delimitmate
  let delimitMate_expand_cr=1
  let delimitMate_expand_space=1

Plug 'docunext/closetag.vim'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-sayonara'
Plug 'int3/vim-extradite'

Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
  " Check syntax on save
  autocmd BufWritePost * Neomake
  " Open the error list when errors are present
  let g:neomake_open_list = 2
  let g:neomake_jsx_enabled_makers = ["eslint"]
  let g:neomake_javascript_enabled_makers = ["eslint"]
  let g:neomake_typescript_enabled_makers = []

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'matchit.zip'
Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
  nmap <Leader>a <Plug>(EasyAlign)

Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>ge :Gedit<CR>
  nnoremap <leader>gr :Gread<CR>

Plug 'alexdavid/vim-min-git-status'

Plug 'jeetsukumaran/vim-filebeagle'
  command! Tex :tabnew | :FileBeagle
  command! Sex :split | :FileBeagle
  command! Vex :vsplit | :FileBeagle
  command! Exp :FileBeagle

Plug 'Shougo/deoplete.nvim'
Plug 'marijnh/tern_for_vim', { 'do': '/usr/local/bin/npm install' }
Plug 'gabesoft/vim-ags'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'junegunn/seoul256.vim'
Plug 'jacoborus/tender.vim'

" Syntax plugins
Plug 'hail2u/vim-css3-syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'
Plug 'othree/html5-syntax.vim'
Plug 'tpope/vim-markdown', { 'for': 'md' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = "underscore,backbone,react,jquery,requirejs,handlebars"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'jnwhiteh/vim-golang', { 'for': 'go' }
Plug 'evanmiller/nginx-vim-syntax'
Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug'

" Add plugins to &runtimepath
call plug#end()


if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#enable_at_startup = 1

" Set the colorscheme
colorscheme seoul256
let g:seoul256_background = 235

" Some kind of security thing
set modelines=0

" Use true colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors

" Set the colorscheme to dark mode
set background=dark

" Automatically reload on file changes
set autoread

" Display the 100th column
set colorcolumn=100

" Enable syntax
syntax enable

" Set our mapleader key
let mapleader = "\<Space>"

" Bind jj to escape in insert mode for easier escapes
inoremap jj <Esc>

" Save with an easy shortcut
nnoremap <Leader>w :w<CR>

" Quit with an easy shortcut
nnoremap <Leader>q :Sayonara<CR>

" Close the file, leave the window/split
nnoremap <Leader>c :Sayonara!<CR>

" Copy & paste to the system clipboard with <leader>y||p
nnoremap <leader>y "+y
nnoremap <leader>y "+y
vnoremap <leader>y "+y
vnoremap <leader>p "+p

" Tab rules
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Line number rules
set number

if exists('+relativenumber')
  set rnu
else
  set nu
endif

" Always scroll to what we're searching for
set scrolloff=3

" Automatically attempt to handle indentation
set autoindent

" Automatically attempt to set the working directory to the current
" file. This value will be superceeded by rooter if it is installed
set autochdir

" Display the current mode at the bottom of the window
set showmode

" Extra information about the command you're running in the status bar
set showcmd
set hidden

" Auto complete filenames when in :Ex mode, etc
set wildmenu
set wildmode=list:longest

set visualbell
set cursorline
set ttyfast

" Display the row and column of the cursor in the status line
set ruler
set backspace=indent,eol,start

" Always show the status line
set laststatus=2

" Fasting escaping out of insert mode
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" Highlight search results
set hlsearch

" Initially ignore cases in searches
set ignorecase

" Smart case searching. Case insensitive if all lowercase, but if you
" provide uppercase it will force matching case
set smartcase

" Support incremental searches (searching while you type)
set incsearch

" Visually display matching braces
set showmatch

" Don't wrap
set nowrap

set formatoptions=qrn1

" Handy key remaps
map <c-f> <c-f>zz
map <c-b> <c-b>zz
map n nzz
map N Nzz

" Switching between tabs using Shift+Tab
nnoremap <Leader>] :tabn<CR>
nnoremap <Leader>[ :tabp<CR>
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>6 6gt<CR>
nnoremap <Leader>7 7gt<CR>
nnoremap <Leader>8 8gt<CR>
nnoremap <Leader>9 9gt<CR>
nnoremap <Leader>0 :tablast<CR>

" Jumping around errors
noremap [ :lprev<CR>
noremap ] :lnext<CR>

" Searching using Ctrl+P
noremap <Leader><space> :GitFiles<CR>
noremap <Leader>p :GitFiles<CR>
noremap <Leader>F :Ag<CR>
noremap <Leader>* :Ag <C-R><C-W><CR>


" Quick netrw
noremap <Leader>t :Tex<CR>
noremap <Leader>e :Exp<CR>
noremap <Leader>v :Vex<CR>
noremap <Leader>s :Sex<CR>

" Quick refresh
noremap <Leader>r :so $MYVIMRC<CR>
noremap <Leader>e :tabe $MYVIMRC<CR>

" Disable Ex mode
map Q <ESC>

" Prevent goofy backup files
set nobackup

" Prevent the creation of swp files, they're just a mess
set noswapfile

" Prevent double save
set nowritebackup

" Open vertical splits to the right by default
set splitbelow
set splitright

" More natural split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Use deoplete.
let g:deoplete#enable_at_startup = 1