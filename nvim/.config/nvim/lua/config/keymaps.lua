vim.keymap.set({ "n" }, "<leader>ml", "<cmd>LiveServer<cr>", { silent = true })
vim.keymap.set({ "n" }, "<leader>mf", "<cmd>Telescope flutter commands<cr>", { silent = true })

vim.keymap.set("n", "<A-S-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-S-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("v", "<A-S-j>", ":m '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("v", "<A-S-k>", ":m '<-2<CR>gv-gv", { silent = true })

vim.keymap.set("n", "<A-S-h>", ":BufferLineMovePrev<cr>", { silent = true })
vim.keymap.set("n", "<A-S-l>", ":BufferLineMoveNext<cr>", { silent = true })

vim.keymap.set("n", "<S-u>", ":Telescope undo<cr>", { silent = true })
