local M = {
  -- "ellisonleao/gruvbox.nvim",
  -- "LunarVim/darkplus.nvim",
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  -- vim.api.nvim_create_autocmd("ColorScheme", {
  --   pattern = "*",
  --   callback = function()
  --     if vim.g.colors_name == "gruvbox" then
  --       -- I don't like the default background of the sign column
  --       vim.cmd "highlight! link SignColumn Normal"
  --     end
  --   end,
  -- })
  -- vim.cmd.colorscheme "darkplus"
  -- vim.cmd.colorscheme "gruvbox"
  vim.cmd.colorscheme "catppuccin"
end

return M
