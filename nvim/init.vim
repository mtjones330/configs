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
set mouse=a
set shell=bash\ -l

let g:netrw_banner = 0
let mapleader = ' '

imap kj <ESC>

nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>w :w<CR>

nnoremap <leader>e :NvimTreeToggle<CR>

nnoremap <leader>q :Bd<CR> 
nnoremap <silent>H :BufferLineCyclePrev<CR>
nnoremap <silent>L :BufferLineCycleNext<CR> 
nnoremap <silent><C-h> :BufferLineMovePrev<CR>
nnoremap <silent><C-l> :BufferLineMoveNext<CR>
nnoremap <leader>t :enew<Cr>

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
  Plug 'moll/vim-bbye'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()

colorscheme nordfox
set background=dark
set termguicolors

lua << EOF

require('bufferline').setup{
  options = {
    close_command = 'Bdelete! %d',
    separator_style = 'slant',
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } }
  }
}

require('telescope').setup{}

require('nvim-tree').setup{
  renderer = {
    group_empty = true,
  }
}

require('toggleterm').setup{
  open_mapping = [[<c-\>]],
  direction = 'float',
  float_opts = {
    border = 'curved'
  }
}

require('nvim-treesitter.configs').setup{
  ensure_installed = { 'bash', 'cpp', 'css', 'scss', 'html', 'java', 'javascript', 'jsdoc', 'json', 'kotlin', 'lua', 'typescript', 'markdown' },
  highlight = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000
  }
}

require('nvim-lsp-installer').setup {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

EOF

