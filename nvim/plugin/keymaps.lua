local keymap = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { silent = true, desc = desc })
end

-- Clear on pressing <Esc> in normal mode
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", "")

-- Toggle between two most recent buffers
keymap("n", "<m-tab>", "<c-6>", "")

keymap("n", "<leader>x", "<cmd>.lua<CR>", "Execute the current line")
keymap("n", "<leader><leader>x", "<cmd>source %<CR>", "Execute the current file")

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
