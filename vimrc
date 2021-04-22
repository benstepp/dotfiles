set nocompatible

set autoindent
set background=dark
set backspace=indent,eol,start
set breakindent
set complete=.,w,t
set cursorline
set encoding=utf-8 nobomb
set expandtab
set fileformats=unix
set foldcolumn=0
set foldenable
set foldmethod=syntax
set foldminlines=1
set foldnestmax=5
set foldlevel=5
set guifont=Consolas:h14
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=trail:·,tab:>-
set mouse=a
set noerrorbells
set noshowmode
set nostartofline
set number
set numberwidth=4
set ruler
set shell=/bin/zsh
set shiftwidth=2
set shortmess=atI
set showcmd
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set title
set ttyfast
set wildignore+=.DS_Store
set wildignore+=*.o
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.psd
set wildignore+=*/tmp/*,*.so,*.swp*,*.zip,*/node_modules/*
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*
set wildignore+=*/stylesheets/bourbon/*,*/stylesheets/neat/*
set wildignore+=*/wp-admin/*,*/wp-includes/*
set wildignore+=*/_build/*,*/deps/*
set wildignore+=*/target/*
set wildmode=list:longest,list:full

filetype plugin indent on
syntax on

call plug#begin('~/.nvim/plugged')

Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'garbas/vim-snipmate'
Plug 'glench/vim-jinja2-syntax'
Plug 'jgdavey/tslime.vim'
Plug 'leafgarland/typescript-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/snipmate-snippets'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-test/vim-test'

call plug#end()

hi Normal          ctermfg=252 ctermbg=232
hi Normal guibg=NONE ctermbg=NONE
hi VertSplit       ctermfg=0 ctermbg=7

let delimitMate_expand_cr = 1
let delitmitMate_expand_space = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:typescript_indent_disable = 1
let g:jsx_ext_required = 0
let NERDTreeRespectWildIgnore = 1
let NERDTreeCascadeSingleChildDir = 0
let g:markdown_preview_eager = 1
let g:snipMate = {'snippet_version': 1}

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#syntastic#enabled = 1

"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_js_enabled_makers = ['eslint']
"let g:neomake_jsx_enabled_makers = ['eslint']
"let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_html_enabled_makers = []

let g:tslime = {}
let g:tslime['session'] = 0
"let g:tslime['session'] = ! 'tmux display-message -p "#S"'
let g:tslime['session'] = str2nr(system('tmux display-message -p "#S"'))
let g:tslime['window'] = 3
let g:tslime['pane'] = 1
let test#strategy = "tslime"

let mapleader = ' '
nnoremap <Leader>q :bp <BAR> bd #<CR>
nnoremap <Leader>v :vs<CR>
nnoremap <Leader>h :sp<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>= mpHmhgg=G'hzt'p
nnoremap <Leader>-  vi{:'<,'>sort<CR>
nnoremap <silent> <Leader>t :w<CR> :TestFile<CR>
nnoremap <silent> <Leader>s :w<CR> :TestNearest<CR>
nnoremap <silent> <Leader>l :w<CR> :TestLast<CR>

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
nnoremap <Leader>r zM
nnoremap <Leader>e zR
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-n> :enew<CR>
nnoremap <C-x> :bp <BAR> bd #<CR>
nnoremap <C-p> :CtrlP<CR>

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command E Explore

highlight ColorColumn ctermbg=160 guibg=magenta
call matchadd('ColorColumn', '\%81v', 100)

au BufNewFile,BufRead Dockerfile* set filetype=dockerfile
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.twig set filetype=jinja

hi clear CursorLine
hi CursorLineNR cterm=bold
augroup CLSet
  autocmd! ColorScheme * hi clear CursorLine
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

augroup NoSwap
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'e'
augroup END

autocmd BufWritePre * :%s/\s\+$//e

function! UnzoomTmux()
  if system('tmux list-panes -F "#F"') !~# 'Z'
  else
    call system('tmux resize-pane -Z')
  endif
endfunction

autocmd! BufReadPost * Neomake
autocmd! BufWritePost * Neomake
let g:loaded_airline_themes=1
autocmd FileType javascript :set fmr=/**,*/ fdm=marker fdc=1
