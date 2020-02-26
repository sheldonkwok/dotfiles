set t_Co=256
set background=dark
colorscheme fmj

call plug#begin('~/.local/share/nvim/plugged')

""" Plugs
" Tools
Plug 'mtth/scratch.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'dbakker/vim-projectroot'

Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'airblade/vim-gitgutter'
let g:fugitive_gitlab_domains = ['https://git.2nd.io']

Plug 'bronson/vim-trailing-whitespace'
Plug 'w0rp/ale'
" Plug 'jiangmiao/auto-pairs'

" typescript
Plug 'Quramy/vim-js-pretty-template'
Plug 'HerringtonDarkholme/yats.vim'
let g:polyglot_disabled = ['go', 'typescript', 'elixir']

Plug 'sheerun/vim-polyglot'

" golang
Plug 'fatih/vim-go'

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" markdown
Plug 'shime/vim-livedown'


autocmd FileType typescript let $PATH .= ":" . trim(system("npm bin"))


" terraform
Plug 'hashivim/vim-terraform'
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-hclfmt'

" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" completion
Plug 'Valloric/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tsserver'

call plug#end()

syntax enable

let g:AutoPairsFlyMode = 1

call jspretmpl#register_tag('sql', 'sql')
" autocmd FileType typescript syn clear typescriptTemplate
autocmd FileType typescript JsPreTmpl


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

" keep paste buffer
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
nnoremap tt :tabnew .<CR>
nnoremap tn1 :tabn 1<CR>
nnoremap tn2 :tabn 2<CR>
nnoremap tn3 :tabn 3<CR>
nnoremap tn4 :tabn 4<CR>

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
" \   'elixir': ['mix_format'],
let g:ale_fixers = {
\   'ruby': ['prettier'],
\   'json': ['prettier'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'markdown': ['prettier'],
\   'yaml': ['prettier'],
\}

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --print-width 110'

let g:ale_yaml_yamllint_options =
\   get(g:, 'ale_yaml_yamllint_options', '-c $HOME/.yamllint.yml')

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
autocmd FileType typescript nnoremap <Leader>r :YcmCompleter RefactorRename

" Go
let g:go_fmt_command = "goimports"
set completeopt-=preview

" Python
au FileType python setl sw=4 sts=4 et

" Jenkinsfile
au FileType Jenkinsfile setl sw=4 sts=4 et

" Rust
" let g:ycm_rust_src_path = '/home/sheldon/.cargo/bin/rustc'
let g:rustfmt_autosave = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
