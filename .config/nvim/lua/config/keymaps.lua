-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
vim.keymap.set("n", "<c-\\>", "<CMD>ToggleTerm direction=float<CR>", { desc = "Toggle terminal command" })
vim.keymap.set("t", "<c-\\>", "<CMD>ToggleTerm<CR>", { desc = "Toggle terminal command" })
-- vim.keymap.set({ "n", "v" }, "<leader>ct", require("stay-centered").toggle, { desc = "Toggle stay-centered.nvim" })
