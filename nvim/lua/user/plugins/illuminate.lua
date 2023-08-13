local M = {
  "RRethy/vim-illuminate",
}

function M.config()
  local status_ok, _ = pcall(require, "illuminate")
  if not status_ok then
    return
  end
end

return M
