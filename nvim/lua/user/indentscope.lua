local M = {
  "echasnovski/mini.indentscope",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = "VeryLazy",
}

function M.config()
  local icons = require "user.icons"
  require("mini.indentscope").setup {
    symbol = icons.ui.LineMiddle,
  }
end

return M
