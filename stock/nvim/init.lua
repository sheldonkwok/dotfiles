-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Movement
    'scrooloose/nerdtree',
    'ibhagwan/fzf-lua',
    
    -- Completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    
    -- TypeScript/LSP
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    
    -- HashiCorp
    'hashivim/vim-terraform',
    
    -- Other file types
    'blankname/vim-fish',
    'earthly/earthly.vim',
    
    -- Misc
    'ruanyl/vim-gh-line',
    
    -- Colors
    'navarasu/onedark.nvim',
  },
  install = { colorscheme = { "onedark" } },
  checker = { enabled = false },
})

require("lsp-config")

vim.cmd [[
  let g:onedark_config = {
    \ 'style': 'warmer',
  \}
  colorscheme onedark
  " set background=dark

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

