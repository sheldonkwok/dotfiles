-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<Leader><Leader>", "<cmd>q<CR>", { noremap = true })
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })
vim.keymap.set("n", "tt", "<cmd>tabnew .<CR>", { noremap = true })
vim.keymap.set("n", "tn1", "<cmd>tabn 1<CR>", { noremap = true })
vim.keymap.set("n", "tn2", "<cmd>tabn 2<CR>", { noremap = true })
vim.keymap.set("n", "tn3", "<cmd>tabn 3<CR>", { noremap = true })
vim.keymap.set("n", "tn4", "<cmd>tabn 4<CR>", { noremap = true })
