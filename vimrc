set nocompatible

set autoindent
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
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.psd
set wildignore+=*/tmp/*,*.so,*.swp*,*.zip,*/node_modules/*
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*
set wildignore+=*/stylesheets/bourbon/*,*/stylesheets/neat/*
set wildignore+=*/wp-admin/*,*/wp-includes/*
set wildmode=list:longest,list:full

filetype plugin indent on
syntax on

call plug#begin('~/.nvim/plugged')

Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'garbas/vim-snipmate'
Plug 'glench/vim-jinja2-syntax'
Plug 'honza/vim-snippets'
Plug 'jgdavey/tslime.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lilydjwg/colorizer'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'raimondi/delimitmate'
Plug 'rhysd/nyaovim-markdown-preview'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/snipmate-snippets'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'

call plug#end()

hi Normal          ctermfg=252 ctermbg=232
hi CursorLine                  ctermbg=232   cterm=none
hi CursorLineNr    ctermfg=208 ctermbg=234               cterm=none
hi Boolean         ctermfg=135
hi Character       ctermfg=144
hi Number          ctermfg=135
hi String          ctermfg=229
hi Conditional     ctermfg=161               cterm=bold
hi Constant        ctermfg=135               cterm=bold
hi Cursor          ctermfg=16  ctermbg=253
hi Debug           ctermfg=225               cterm=bold
hi Define          ctermfg=81
hi Delimiter       ctermfg=241

hi DiffAdd                     ctermbg=24
hi DiffChange      ctermfg=181 ctermbg=239
hi DiffDelete      ctermfg=162 ctermbg=53
hi DiffText                    ctermbg=102   cterm=bold

hi Directory       ctermfg=118               cterm=bold
hi Error           ctermfg=219 ctermbg=89
hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
hi Exception       ctermfg=118               cterm=bold
hi Float           ctermfg=135
hi FoldColumn      ctermfg=67  ctermbg=16
hi Folded          ctermfg=67  ctermbg=16
hi Function        ctermfg=118
hi Identifier      ctermfg=208               cterm=none
hi Ignore          ctermfg=244 ctermbg=232
hi IncSearch       ctermfg=193 ctermbg=16

hi keyword         ctermfg=161               cterm=bold
hi Label           ctermfg=229               cterm=none
hi Macro           ctermfg=193
hi SpecialKey      ctermfg=81

hi MatchParen      ctermfg=047  ctermbg=232  cterm=bold
hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229
hi Operator        ctermfg=161

" complete menu
hi Pmenu           ctermfg=81  ctermbg=16
hi PmenuSel        ctermfg=255 ctermbg=242
hi PmenuSbar                   ctermbg=232
hi PmenuThumb      ctermfg=81

hi PreCondit       ctermfg=118               cterm=bold
hi PreProc         ctermfg=118
hi Question        ctermfg=81
hi Repeat          ctermfg=161               cterm=bold
hi Search          ctermfg=0   ctermbg=222   cterm=NONE

" marks column
hi SignColumn      ctermfg=118 ctermbg=235
hi SpecialChar     ctermfg=161               cterm=bold
hi SpecialComment  ctermfg=245               cterm=bold
hi Special         ctermfg=81
if has("spell")
hi SpellBad                    ctermbg=52
hi SpellCap                    ctermbg=17
hi SpellLocal                  ctermbg=17
hi SpellRare  ctermfg=none     ctermbg=none  cterm=reverse
endif
hi Statement       ctermfg=161               cterm=bold
hi StatusLine      ctermfg=238 ctermbg=253
hi StatusLineNC    ctermfg=244 ctermbg=232
hi StorageClass    ctermfg=208
hi Structure       ctermfg=81
hi Tag             ctermfg=161
hi Title           ctermfg=166
hi Todo            ctermfg=231 ctermbg=232   cterm=bold

hi Typedef         ctermfg=81
hi Type            ctermfg=81                cterm=none
hi Underlined      ctermfg=244               cterm=underline

hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
hi VisualNOS                   ctermbg=238
hi Visual                      ctermbg=235
hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
hi WildMenu        ctermfg=81  ctermbg=16

hi Comment         ctermfg=59
hi CursorColumn                ctermbg=234
hi ColorColumn                 ctermbg=234
hi LineNr          ctermfg=250 ctermbg=234
hi NonText         ctermfg=59

hi SpecialKey      ctermfg=59

let delimitMate_expand_cr = 1
let delitmitMate_expand_space = 1
let g:ctrlp_working_path_mode = 'r'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:typescript_indent_disable = 1
let NerdTreeRespectWildIgnore = 1
let g:rspec_command = ':call Send_to_Tmux("RAILS_ENV=test rspec --color {spec}\n")'
let g:VtrOrientation = 'h'
let g:VtrPercentage = 30

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#syntastic#enabled = 1

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_js_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
"let g:neomake_scss_enabled_makers = ['scsslint']
"let g:neomake_scss_scsslint_maker = { 'args': ['--config ~/.scss-lint.yml']}
let g:neomake_ruby_enabled_makers = ['rubocop']

let mapleader = ' '
nnoremap <Leader>q :bp <BAR> bd #<CR>
nnoremap <Leader>v :vs<CR>
nnoremap <Leader>h :sp<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>= mpHmhgg=G'hzt'p
nnoremap <silent> <Leader>t :w<CR>:call RunCurrentSpecFile()<CR>
nnoremap <silent> <Leader>s :w<CR>:call RunNearestSpec()<CR>
nnoremap <silent> <Leader>l :w<CR>:call RunLastSpec()<CR>
nnoremap <silent> <Leader>fr :VtrFocusRunner<CR>
nnoremap <silent> <Leader>fe :VtrDetachRunner<CR>

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
nnoremap ze zM
nnoremap zE zM
nnoremap ZE zM
nnoremap zr zR
nnoremap ZR zR
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
