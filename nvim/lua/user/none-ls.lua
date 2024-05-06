local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      -- formatting.black,
      -- require("none-ls.diagnostics.flake8"),
      -- require("none-ls.diagnostics.ruff"), -- Using ruff_lsp instead
      -- require("none-ls.formatting.ruff"),
      null_ls.builtins.completion.spell,
    },
  }
end

return M
