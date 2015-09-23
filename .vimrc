set t_Co=256
set background=dark
colorscheme peachpuff

""" Start Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

""" Plugins
" Tools
Plugin 'chriskempson/base16-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'

" Languages
Plugin 'scrooloose/syntastic'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
Plugin 'fatih/vim-go'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'yosssi/vim-ace'
Plugin 'wavded/vim-stylus'
Plugin 'cespare/vim-toml'
Bundle 'chase/vim-ansible-yaml'

call vundle#end()
filetype plugin indent on
""" End Vundle

" file types
au BufRead,BufNewFile *.json.ejs set filetype=json
au BufRead,BufNewFile *.ctmpl set filetype=gotexttmpl
au BufRead,BufNewFile *.dockerfile set filetype=dockerfile

let g:syntastic_mode_map = { 'passive_filetypes': ['coffee'] }

" vimrc settings
au VimEnter * RainbowParenthesesToggle

syntax enable

vnoremap <leader>p "_dP
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
nnoremap ; :
nnoremap : ;

set number
highlight LineNr ctermfg=DarkGrey

set ai
set expandtab
set tabstop=2
retab
set shiftwidth=2
set autoindent
set smarttab
au FileType python setl sw=4 sts=4 et

set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap
set incsearch

set ttyfast
set lazyredraw

set backspace=indent,eol,start

function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

vnoremap <silent> <expr> p <sid>Repl()

" tabs
nnoremap tt :tabnew<CR>
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>

" Always show statusline
set laststatus=2
"
" Autofix whitespace
:autocmd BufWritePost * :FixWhitespace

highlight SignColumn ctermbg=none

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Tabular
noremap ta :Tab /=<CR>
noremap ts :Tab/:\zs /l0<CR>

" Go
let g:go_fmt_command = "goimports"
set completeopt-=preview
