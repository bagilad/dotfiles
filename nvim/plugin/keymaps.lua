local keymap = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { silent = true, desc = desc })
end

-- Clear on pressing <Esc> in normal mode
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", "")

-- Save file
keymap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", "Save File")

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
keymap("n", "<leader>xd", vim.diagnostic.open_float, "Show diagnostic error messages")
keymap("n", "<leader>xq", vim.diagnostic.setloclist, "Open diagnostic quickfix list")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", "")
keymap({ "n", "o", "x" }, "<s-l>", "g_", "")
