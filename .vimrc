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
Plug 'w0rp/ale'

Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-hclfmt'
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

" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'json': ['prettier'],
\}

" Polyglot
let g:polyglot_disabled = ['terraform']

" HCL
let g:hcl_fmt_autosave = 1
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0

" Terraform
let g:terraform_fmt_on_save = 1

" Typescript
let g:polyglot_disabled = ['typescript']
autocmd FileType typescript nnoremap <Leader>d :split <bar> YcmCompleter GoToDefinition <CR>
autocmd FileType typescript nnoremap <Leader>t :YcmCompleter GetType <CR>

" Flow
let g:javascript_plugin_flow = 1

" Go
let g:go_fmt_command = "goimports"
set completeopt-=preview

" Python
au FileType python setl sw=4 sts=4 et

" Jenkinsfile
au FileType Jenkinsfile setl sw=4 sts=4 et

" Rust
let g:ycm_rust_src_path = '/home/sheldon/.cargo/bin/rustc'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
