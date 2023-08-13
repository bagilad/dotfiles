local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  lualine.setup()
end


return M
