local M = {
  "karb94/neoscroll.nvim",
}

function M.config()
--   vim.cmd [[
--   nnoremap <C-j> <C-D>
--   vnoremap <C-j> <C-D>
--
--   nnoremap <C-k> <C-U>
--   vnoremap <C-k> <C-U>
-- ]]
  require("neoscroll").setup {}
end

return M
