return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local tc = require "todo-comments"
    tc.setup({})
    vim.keymap.set("n", "]t", function()
      tc.jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      tc.jump_prev()
    end, { desc = "Previous todo comment" })
  end,
  -- TODO: fsdfsdfsdf
  -- TODO: fsdfsdfsdf
}
