local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
    v = { "<cmd>vsplit<CR>", "v-split" },
    b = { name = "Buffers", _ = "which_key_ignore" },
    d = { name = "Debug", _ = "which_key_ignore" },
    f = { name = "Find", _ = "which_key_ignore" },
    g = { name = "Git", _ = "which_key_ignore" },
    l = { name = "LSP", _ = "which_key_ignore" },
    p = { name = "Plugins", _ = "which_key_ignore" },
    t = { name = "toggle", _ = "which_key_ignore" },
    T = { name = "Test", _ = "which_key_ignore" },
  }

  local which_key = require "which-key"

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
