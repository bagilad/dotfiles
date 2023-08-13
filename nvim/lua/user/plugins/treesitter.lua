local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter")
  local configs = require("nvim-treesitter.configs")

  configs.setup({
      ensure_installed = { "lua", "python" },
      sync_install = false,
      highlight = { enable = true },
      autopairs = { enable = true },
      indent = { enable = true, disable = {"python"} },
    })
end

return M
