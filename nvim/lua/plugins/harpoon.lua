local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local harpoon = require "harpoon"
  harpoon:setup()
  vim.keymap.set("n", "<leader>h", function()
    harpoon:list():add()
  end, { desc = "add to harpoon" })

  vim.keymap.set("n", "<C-h>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  -- Set <space>1..<space>5 be my shortcuts to moving to the files
  for _, idx in ipairs { 1, 2, 3, 4, 5 } do
    vim.keymap.set("n", string.format("<space>%d", idx), function()
      harpoon:list():select(idx)
    end, { desc = "which_key_ignore" })
  end
end

return M
