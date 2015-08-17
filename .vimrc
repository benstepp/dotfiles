set nocompatible

set autoindent
set backspace=indent,eol,start
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
set listchars=trail:·,tab:>-,eol:¬
set mouse=a
set noerrorbells
set noshowmode
set nostartofline
set number
set numberwidth=4
set ruler
set shell=/bin/sh
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
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.psd
set wildignore+=*/tmp/*,*.so,*.swp*,*.zip,*/node_modules/*
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*
set wildmode=list:longest,list:full

filetype plugin indent on
syntax on
colorscheme molokai

call plug#begin('~/.nvim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'raimondi/delimitmate'

Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'beyondwords/vim-twig'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'scrooloose/snipmate-snippets'
Plug 'lilydjwg/colorizer'

call plug#end()

let delimitMate_expand_cr = 1
let delitmitMate_expand_space = 1

let g:molokai_original = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:aitline_enable_syntastic = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_html_checkers = [""]
let g:syntastic_jsx_checkers = ["eslint"]
let g:syntastic_js_checkers = ["eslint"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_scss_checkers = ["scss_lint"]
let g:syntastic_scss_scss_lint_args='--config ~/.scss-lint.yml'
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}

let g:ctrlp_working_path_mode = 'r'

let NerdTreeRespectWildIgnore = 1
nnoremap ,n :NERDTreeToggle<CR>
nnoremap ,b :NERDTreeFromBookmark 

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
vnoremap <Up> DVB_Drag('up')
vnoremap <Down> DVB_Drag('down')
vnoremap <Left> DVB_Drag('left')
vnoremap <Right> DVB_Drag('right')
nnoremap J 10j
nnoremap K 10k
nnoremap ze zM
nnoremap zE zM
nnoremap ZE zM
nnoremap zr zR
nnoremap ZR zR
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-n> :enew<CR>
nnoremap <C-x> :bp <BAR> bd #<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-o> :CtrlP ~\Code\<CR>
nnoremap <C-p> :CtrlP<CR>
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>
nnoremap ,q :bp <BAR> bd #<CR>
nnoremap ,v :vs<CR>
nnoremap ,h :sp<CR>

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command E Explore

highlight ColorColumn ctermbg=magenta guibg=magenta
call matchadd('ColorColumn', '\%81v', 100)

hi WhiteOnRed guifg=#ffffff guibg=#D32F2F
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

au BufNewFile,BufRead *.es6 set filetype=javascript

hi clear CursorLine
hi CursorLineNR cterm=bold
augroup CLSet
  autocmd! ColorScheme * hi clear CursorLine
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
