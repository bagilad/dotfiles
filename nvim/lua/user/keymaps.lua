local keymap = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { silent = true, desc = desc })
end

keymap("n", "<Space>", "", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reason for this could be because on some terminals <C-i>
-- and Tab codes are the same, so by this we avoid a remmapping
-- of <C-i> when Tab is remmapped
keymap("n", "<C-i>", "<C-i>", "")

-- Clear on pressing <Esc> in normal mode
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", "")

-- Better window navigation
keymap("n", "<c-h>", ":wincmd h<CR>", "")
keymap("n", "<c-j>", ":wincmd j<CR>", "")
keymap("n", "<c-k>", ":wincmd k<CR>", "")
keymap("n", "<c-l>", ":wincmd l<CR>", "")
keymap("n", "<c-tab>", "<c-6>", "")

keymap("n", "n", "nzz", "")
keymap("n", "N", "Nzz", "")
keymap("n", "*", "*zz", "")
keymap("n", "#", "#zz", "")
keymap("n", "g*", "g*zz", "")
keymap("n", "g#", "g#zz", "")

-- Stay in indent mode
keymap("v", "<", "<gv", "")
keymap("v", ">", ">gv", "")

-- Keeps the value in the register after pasting over another value
keymap("x", "p", [["_dP]], "")

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
keymap("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
keymap("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostic error messages")
keymap("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostic quickfix list")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", "")
keymap({ "n", "o", "x" }, "<s-l>", "g_", "")

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", "")
keymap({ "n", "x" }, "k", "gk", "")
keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", "")

keymap("t", "<C-;>", "<C-\\><C-n>", "")
