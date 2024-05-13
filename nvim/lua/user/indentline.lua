local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
}

function M.config()
  local icons = require "user.icons"

  require("ibl").setup {
    exclude = {
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
      },
      buftypes = { "terminal", "nofile" },
    },
    indent = {
      -- char = icons.ui.LineLeft,
      char = icons.ui.LineMiddle,
    },
  }
end

return M
