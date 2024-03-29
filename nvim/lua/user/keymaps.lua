-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --

-- Better window navigation
keymap("n", "<leader>v", "<C-w>v", opts)
keymap("n", "<leader>s", "<C-w>s", opts)
keymap("n", "<leader>q", "<cmd>q<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<leader><Up>", ":resize +16<cr>", opts)
keymap("n", "<leader><Down>", ":resize -16<CR>", opts)
keymap("n", "<leader><Left>", ":vertical resize -32<CR>", opts)
keymap("n", "<leader><Right>", ":vertical resize +32<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<", ":BufferLineMovePrev<CR>", opts)
keymap("n", ">", ":BufferLineMoveNext<CR>", opts)

-- Clear highlights
keymap("n", "<leader>c", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Save buffers
keymap("n", "<S-w>", "<cmd>w<CR>", opts)


-- Insert --

-- Press kj fast to enter
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("v", "J", ":m '>+1<CR>gv=gv")

-- Jump to end of word
keymap("i", "<C-e>", "<ESC>Ea", opts)

-- Jump to begining of word
keymap("i", "<C-b>", "<ESC>Bi", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
keymap("n", "gi", ":Telescope lsp_implementations<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

keymap("n", "<leader>u", ":<C-u>NgSwitchHTML<CR>", opts)
keymap("n", "<leader>i", ":<C-u>NgSwitchTS<CR>", opts)
keymap("n", "<leader>o", ":<C-u>NgSwitchCSS<CR>", opts)
keymap("n", "<leader>p", ":<C-u>NgSwitchSpec<CR>", opts)

