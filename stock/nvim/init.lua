require('packer').startup(function()
  -- Packer 
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Movement
  use 'scrooloose/nerdtree'
  use 'ibhagwan/fzf-lua'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- TypeScript
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"

  -- HashiCorp
  use 'hashivim/vim-terraform'

  -- Other file types
  use 'blankname/vim-fish'
  use 'earthly/earthly.vim'

  -- misc
  use 'ruanyl/vim-gh-line'
end)

require("lsp-config")

vim.cmd [[
  colorscheme fmj
  set background=dark

  set noswapfile

	filetype plugin indent on
	set ai
	set expandtab
	set tabstop=2
	set shiftwidth=2
	set autoindent
	set smarttab
	retab

	" remaps
	let mapleader = ","
  noremap <Leader><Leader> :q <CR>
	nnoremap ; :
	nnoremap : ;

  set hlsearch
  set incsearch
  set ignorecase
  set smartcase

  set nowrap
  set incsearch
  set number

  set ttyfast
  set lazyredraw
  set ff=unix

  " tabs
  nnoremap tt :tabnew .<CR>
  nnoremap tn1 :tabn 1<CR>
  nnoremap tn2 :tabn 2<CR>
  nnoremap tn3 :tabn 3<CR>
  nnoremap tn4 :tabn 4<CR>

  " autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
  set autochdir

  " misc
  let g:gh_gitlab_domain = "git.2nd.io"

  au BufRead,BufNewFile *.earthfile set filetype=Earthfile
  au BufRead,BufNewFile Earthfile set filetype=Earthfile
]]

vim.api.nvim_set_keymap('n', '<Leader>f',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })

