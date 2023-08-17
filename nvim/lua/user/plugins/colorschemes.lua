-- Themes: each theme should be defined in this format
local tokyonight = {
      "folke/tokyonight.nvim",
      lazy = false,    -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
    }
tokyonight.opt = {
  style = "storm", -- `storm`, `moon`, a darker variant `night` and `day`
}
-- The actual colorscheme that will be used if this theme is selected
tokyonight.colorscheme = "tokyonight"

local onedark = { "joshdick/onedark.vim" }
onedark.colorscheme = "onedark"

local catppuccin = { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
catppuccin.opt = {
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
}
catppuccin.colorscheme = "catppuccin"

-- The selected theme
local M = catppuccin

function M.config()
  if M.opt ~= nil then
    require(M.colorscheme).setup(M.opt)
  end
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.colorscheme)
  if not status_ok then
    return
  end

end

return M
