" Requirements:
" - vim-plug (https://github.com/junegunn/vim-plug#neovim)
" - a nerd font (Caskaydia Cove Nerd Font Complete Mono)
" - ripgrep (sudo apt install ripgrep)

syntax on

set nu
set nohlsearch
set incsearch
set noerrorbells
set backspace=indent,eol,start
set relativenumber
set hidden
set nowrap
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set expandtab
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set ruler
set laststatus=2
set signcolumn=yes
set colorcolumn=120
set scrolloff=8
set cursorline
set cursorlineopt=number

let g:netrw_banner = 0
let mapleader = " "

imap kj <ESC>

nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <leader>q :bd<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>e :E<CR>
nnoremap <leader>t :tabnew<Cr>
nnoremap <silent>H :BufferLineCyclePrev<CR>
nnoremap <silent>L :BufferLineCycleNext<CR> 

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

vnoremap K :m '<-2<CR>gv
vnoremap J :m '>+1<CR>gv

call plug#begin('~/.vim/plugged')
  Plug 'gruvbox-community/gruvbox'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
call plug#end()

colorscheme gruvbox
set background=dark

set termguicolors
lua << EOF
require("bufferline").setup{
  options = {
    separator_style = "slant"
  }
}

require('telescope').setup{}

EOF

