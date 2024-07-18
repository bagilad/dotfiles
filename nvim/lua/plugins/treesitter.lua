local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "typescript" },
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return M
