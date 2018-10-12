set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'chrisbra/Recover.vim'
Plugin 'farmergreg/vim-lastplace'
Plugin 'fepillar/pgsql.vim'
Plugin 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plugin 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
Plugin 'othree/html5.vim', { 'for': ['html', 'javascript'] }
Plugin 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus'] }
Plugin 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
Plugin 'vim-perl/vim-perl'
Plugin 'yko/mojo.vim'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()

filetype plugin indent on


"set bg=dark
set background=dark
set t_Co=256

syntax enable
set modelines=0
set encoding=utf-8
set number
set hidden
set title
set scrolloff=3
set showmode " disabled by airline below
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set ruler
set ttyfast
set backspace=indent,eol,start
set pastetoggle=<F12>


" perl
let perl_sub_signatures = 1
let perl_extended_vars = 1
let perl_include_pod = 1


" postgres
let g:sql_type_default = 'pgsql'

" syntax checking (ale)
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
let g:ale_linters = {'perl': ['perl'],}
let g:ale_lint_on_text_changed = 'never'

"write buffer
imap <F2> <Esc>:w<CR>a
nmap <F2> :w<CR>

"nerd tree
nmap <silent> <Leader>p :NERDTreeToggle<CR>

" perltidy
nnoremap <Leader>d mz:%!perltidy -q<CR>'z:delmarks z<CR>

" prove current file
nnoremap <Leader>t <Esc>:!prove -l %<CR>
"prove all tests
nnoremap <Leader>ta <Esc>:!prove -lr<CR>

" airline
set ttimeoutlen=50
set laststatus=2
set noshowmode

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline_left_sep = '' " '▶'
let g:airline_right_sep = '' " '◀'
let g:airline_symbols.linenr = '' " '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"

set backup
set backupdir=~/.vim/backup
function! BackupDir()
    let l:backupdir=$HOME.'/.vim/backup/'.
                \substitute(expand('%:p:h'), '^'.$HOME, '~', '')
    if !isdirectory(l:backupdir)
        call mkdir(l:backupdir, 'p', 0700)
    endif

    let &backupdir=l:backupdir

    let &backupext=strftime('~%Y-%m-%d~')
endfunction

autocmd! bufwritepre * call BackupDir()



set mouse=a     " mouse in xterm


nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <DOWN> gj
nnoremap <UP> gk
vnoremap <DOWN> gj
vnoremap <UP> gk
inoremap <DOWN> <C-O>gj
inoremap <UP> <C-O>gk

nnoremap <PAGEUP> <C-U><C-U>
nnoremap <PAGEDOWN> <C-D><C-D>
inoremap <PAGEUP> <C-O><C-U><C-O><C-U>
inoremap <PAGEDOWN> <C-O><C-D><C-O><C-D>
vnoremap <PAGEUP> <C-U><C-U>
vnoremap <PAGEDOWN> <C-D><C-D>


set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs

set list
set listchars=tab:▶▶,trail:◀
highlight SpecialKey ctermbg=159  ctermfg=1

highlight GitGutterAdd ctermfg=14
highlight GitGutterChange ctermfg=13

set colorcolumn=100

"let g:user_emmet_leader_key='<TAB-TAB>'
imap <expr> <tab><tab> emmet#expandAbbrIntelligent("\<tab>>")
