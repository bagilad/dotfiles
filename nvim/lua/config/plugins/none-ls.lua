local M = {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"

  null_ls.setup {
    debug = false,
    sources = {
      null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.completion.spell,
    },
  }
end

return M
