set nocompatible
filetype off
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

let win_shell = (has('win32') || has('win64') && &shellcmdflag =~ '/')

set backspace=indent,eol,start
set number
set numberwidth=4
set ruler
set hlsearch
set showcmd
set laststatus=2
set autochdir

set lines=52 columns=180

set list
set listchars=trail:·,tab:>-,eol:¬

if win_shell
    set guifont=Consolas:h10
else
    set guifont=Consolas:h14
endif

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set splitbelow
set splitright

set wildignore+=*/tmp/*,*.so,*.swp*,*.zip,*/node_modules/*
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"sets colorscheme and fonts
colorscheme molokai
let g:molokai_original = 0

"disables arrow keys
noremap <up> ddkP
noremap <Down> ddp
noremap <Left> <NOP>
noremap <Right> <NOP>

set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
	let col=col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

let vimDir = win_shell ?  '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
call vundle#rc(expand(vimDir . '/bundle'))
call vundle#begin(expand(vimDir . '/bundle'))

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set statusline+=%#warninmsg#
set statusline+=#{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_sings = 1

let g:syntastic_jsx_checkers = ["eslint"]
let g:syntastic_js_checkers = ["eslint"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_scss_checkers = ["scss-lint"]

let g:ctrlp_working_path_mode = 'c'

let NerdTreeRespectWildIgnore = 1
nmap ,n :NERDTreeToggle<CR>
nmap ,b :NERDTreeFromBookmark 

if win_shell
    nnoremap <C-l> :bnext<CR>
    nnoremap <C-h> :bprevious<CR>
    nnoremap <C-n> :enew<CR>
    nnoremap <C-x> :bp <BAR> bd #<CR>
    nnoremap <C-s> :w<CR>
    nnoremap <C-o> :CtrlP D:\srv\<CR>
    nnoremap <C-p> :CtrlP<CR>
else
    nnoremap <D-l> :bnext<CR>
    nnoremap <D-h> :bprevious<CR>
    nnoremap <D-n> :enew<CR>
    nnoremap <D-x> :bp <BAR> bd #<CR>
    nnoremap <D-s> :w<CR>
    nnoremap <D-w> <C-w><C-w>
    nnoremap <D-o> :CtrlP ~\Code\<CR>
    nnoremap <D-p> :CtrlP<CR>
endif

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command E e

nmap ,q :bp <BAR> bd #<CR>
nmap ,v :vs<CR>
nmap ,h :sp<CR>
