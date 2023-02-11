vim.keymap.noremap = true
vim.keymap.silent = true

vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>t", ":split<cr> | :terminal<cr> | :set ma<cr>")
keymap("n", "<leader>vt", ":vsplit<cr> | :terminal<cr> | :set ma<cr>")
keymap("n", "<leader>vsp", ":vsplit<cr>")
keymap("n", "<leader>hsp", ":split<cr>")

keymap('n', '<C-h>', require('smart-splits').move_cursor_left)
keymap('n', '<C-j>', require('smart-splits').move_cursor_down)
keymap('n', '<C-k>', require('smart-splits').move_cursor_up)
keymap('n', '<C-l>', require('smart-splits').move_cursor_right)

keymap('t', '<C-h>', require('smart-splits').move_cursor_left)
keymap('t', '<C-j>', require('smart-splits').move_cursor_down)
keymap('t', '<C-k>', require('smart-splits').move_cursor_up)
keymap('t', '<C-l>', require('smart-splits').move_cursor_right)

keymap("n", "<C-Up>",  require('smart-splits').resize_up)
keymap("n", "<C-Down>",  require('smart-splits').resize_down)
keymap("n", "<C-Left>",  require('smart-splits').resize_left)
keymap("n", "<C-Right>",  require('smart-splits').resize_right)
keymap("n", ":w<cr>", "gg=G'' | :w<cr>") -- Indent on save
keymap("n", "<leader>f", ":Lex 30<cr>")

keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

