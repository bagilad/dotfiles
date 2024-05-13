local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  local harpoon = require("harpoon")
  local function mark_file()
    harpoon:list():add()
    vim.notify "󱡅  marked file"
  end

  keymap("n", "<s-m>", mark_file, opts)
  keymap("n", "<TAB>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
end

return M
