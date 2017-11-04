set t_Co=256
set background=dark
colorscheme fmj

call plug#begin('~/.vim/plugged')

""" Plugs
" Tools
Plug 'mtth/scratch.vim'
Plug 'scrooloose/nerdtree'
" Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'dbakker/vim-projectroot'
" Plug 'majutsushi/tagbar'

Plug 'chriskempson/base16-vim'
" Plug 'tomtom/tlib_vim'
" Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Valloric/YouCompleteMe'
Plug 'sbdchd/neoformat'

Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

syntax enable


" file types
au BufRead,BufNewFile *.json.ejs set filetype=json
au BufRead,BufNewFile *.ctmpl set filetype=gotexttmpl
au BufRead,BufNewFile *.dockerfile set filetype=dockerfile

" remaps
let mapleader = ","
nnoremap ; :
nnoremap : ;

vnoremap <leader>p "_dP
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

set number
highlight LineNr ctermfg=DarkGrey

filetype plugin indent on
set ai
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smarttab
retab

set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap
set incsearch

set ttyfast
set lazyredraw
set ff=unix

set autoread " autoreload

set backspace=indent,eol,start

set mouse-=a

function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

vnoremap <silent> <expr> p <sid>Repl()

" resize vim
autocmd VimResized * wincmd =

noremap <Leader><Leader> :q <CR>

" tabs
nnoremap tt :tabnew<CR>
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>

" Always show statusline
set laststatus=2

set noswapfile

" Autofix whitespace
autocmd BufWritePost * :FixWhitespace

highlight SignColumn ctermbg=none

" Scratch
let g:scratch_autohide = "hidden"

" fzf
nnoremap <Leader>f :ProjectRootExe :Files <CR>
nnoremap <Leader>b :Buffers <CR>

" Typescript
let g:polyglot_disabled = ['typescript']
autocmd BufWritePre *.ts Neoformat
autocmd FileType typescript nnoremap <Leader>d :split <bar> YcmCompleter GoToDefinition <CR>

" Flow
let g:javascript_plugin_flow = 1

" Go
let g:go_fmt_command = "goimports"
set completeopt-=preview

" Python
" let g:syntastic_python_checkers = [flake8]
au FileType python setl sw=4 sts=4 et

let g:neoformat_try_formatprg = 1

" Rust
let g:ycm_rust_src_path = '/home/sheldon/.cargo/bin/rustc'

autocmd BufWritePre *.tf Neoformat
autocmd BufWritePre *.json Neoformat

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
