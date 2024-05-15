local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
    v = { "<cmd>vsplit<CR>", "Split" },
    b = { name = "Buffers" },
    d = { name = "Debug" },
    s = { name = "Search" },
    g = { name = "Git" },
    l = { name = "LSP" },
    p = { name = "Plugins" },
    t = { name = "Toggle" },
    T = { name = "Test" },
  }

  local which_key = require "which-key"

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
