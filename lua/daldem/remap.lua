vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<C-x>", ":!pbcopy<CR>")
vim.keymap.set("v", "<C-c>", ":w !pbcopy<CR><CR>")
vim.keymap.set("n", "<C-v>", ":r !pbpaste<CR><CR>")
vim.keymap.set("i", "<C-v>", "<Esc>:r !pbpaste<CR><CR>")
