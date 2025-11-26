local defaults = { noremap = true, silent = true }
local map = vim.keymap.set

-- add in any lsps here (using nvim lspconfig)
vim.lsp.config("racket_langserver", {})

vim.opt.number = true

vim.opt.spell = false

vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 


vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.diagnostic.config({
    virtual_lines = true
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- keymaps to help me stop using the arrow keys 
map({'n', 'v', 's', 'o'}, '<Up>', '<Nop>', defaults)
map({'n', 'v', 's', 'o'}, '<Down>', '<Nop>', defaults)
map({'n', 'v', 's', 'o'}, '<Left>', '<Nop>', defaults)
map({'n', 'v', 's', 'o'}, '<Right>', '<Nop>', defaults)

map('i', '<Up>', '<Nop>', defaults)
map('i', '<Down>', '<Nop>', defaults)
map('i', '<Left>', '<Nop>', defaults)
map('i', '<Right>', '<Nop>', defaults)

-- key maps to move while in insert mode
map('i', '<C-h>', '<Left>', defaults)
map('i', '<C-j>', '<Down>', defaults)
map('i', '<C-k>', '<Up>', defaults)
map('i', '<C-l>', '<Right>', defaults)

-- switching tabs
for i=1,9,1
do
    map('n', '<leader>'..i, i.. 'gt', {})
end
map('n', '<leader>0', ":tablast<cr>", {})

-- keymaps for quick navigation
map('n', '<Leader>w', ':write<CR>')
map('n', '<Leader>a', ':wqa<CR>')
map('n', '<Leader>x', ':wq<CR>')
map('n', '<Leader>q', ':quit<CR>')
map('n', '<Leader>q!', ':q!<CR>')
map('n' , '<Leader>e', ':e<CR>')
map('n', '<Leader>e!', ':e!<CR>')

map('n', '<C-j>', '<C-w>j')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- insert mode versions
map('i', ';w', '<esc>:write<CR>')
map('i', ';x', '<esc>:wq<CR>')

map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2 <CR>')
map('n', '<C-Left>', ':vertical resize -2 <CR>')
map('n','<C-Right>', ':vertical resize +2 <CR>')

-- buffer keymaps
map('n', '<TAB>', ':bn<CR>')
map('n', '<S-TAB>', ':bp<CR>')
map('n', '<leader>bd', ':bd<CR>')

-- insert mode keymaps (for undo, redo, and other actions)
