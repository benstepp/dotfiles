set nocompatible
filetype off

let win_shell = (has('win32') || has('win64') && &shellcmdflag =~ '/')

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set backspace=indent,eol,start
set number
set numberwidth=4
set ruler
set hlsearch
set showcmd
set laststatus=2

if win_shell
    set lines=55
    set columns=150
else
    set lines=9999
    set columns=9999
endif

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
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
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
let g:syntastic_javascript_checkers = ['eslint']

let NERDTreeMinimalUI = 1
let NERDTreeShowBookmarks = 1

nmap ,n :NERDTreeTabsToggle<CR>
nmap ,b :NERDTreeFromBookmark 
if win_shell
    map <C-l> :tabn<CR>
    map <C-h> :tabp<CR>
    map <C-n> :tabnew<CR>
    map <C-x> :tabclose<CR>
    map <C-s> :w<CR>
else
    map <D-l> :tabn<CR>
    map <D-h> :tabp<CR>
    map <D-n> :tabnew<CR>
    map <D-x> :tabclose<CR>
    map <D-s> :w<CR>
    map <D-w> <C-w><C-w>
endif

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command E e
