" My expertly curated vimrc file
" J. Macoskey
" For more information, see the following website:
" https://realpython.com/blog/python/vim-and-python-a-match-in-heaven/
"
set nocompatible
filetype off

" Call Vindle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic' "checks syntax on each save
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline',{'rtp': 'powerline/bindings/vim/'}
call vundle#end()

filetype plugin indent on

" split navigations
" ctrl-j = move to split below
" ctrl-k = move to split above
" ctrl-l = move to split to the right
" ctrl-h = move to split to the left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> <za> " remaps space to fold/unfold
let g:SimpylFold_docstring_preview=1 " shows docstrings on folded code

" Get Vim to PEP8 indentation standards
au BufNewFile,BufRead *.py " could also add for .js, .html, .css etc
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" Mark bad whitespaces (wasn't working for some reason...)
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Properly set encoding
set encoding=utf-8

" Fix auto-complete
let g:ycm_autoclose_preview_window_after_completion=1
" Makes 'space-g' goto definition of whatever you are currently on
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Make VIM and YouCompleteMe aware of virtual environment
py << EQF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EQF

" Nerd Tree Settings
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore some fils in NERDTree

" Highlighting and Syntax Checking
let python_highlight_all=1
syntax on

" Line Numbers
set number

" File stats
set ruler

" Blink cursor
set visualbell

" Whitespace
set wrap

" Cursor motion
set scrolloff=3

" Allow clipboard commands (copy/paste etc.)
set clipboard=unnamed

" VIM in the shell (turn on for same commands in vi shell)
" set editing-mode vi

" Fix backspace
set backspace=2

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Rendering
set ttyfast

" Color scheme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
