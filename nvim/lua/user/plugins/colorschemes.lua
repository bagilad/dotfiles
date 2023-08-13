-- Themes: each theme should be defined in this format
local tokyonight = {
      "folke/tokyonight.nvim",
      lazy = false,    -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
    }
-- The actual colorscheme that will be used if this theme is selected
tokyonight.colorscheme = "tokyonight"

local onedark = { "joshdick/onedark.vim" }
onedark.colorscheme = "onedark"

-- The selected theme
local M = tokyonight

function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.colorscheme)
  if not status_ok then
    return
  end
end

return M
