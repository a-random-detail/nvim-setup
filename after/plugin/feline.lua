require('feline').setup()

vim.keymap.set("n", "<leader>tn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>tp", vim.cmd.bprev)
vim.keymap.set("n", "<leader>tc", vim.cmd.bdelete)
