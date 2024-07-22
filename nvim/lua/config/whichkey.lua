local wk = require "which-key"

wk.add {
  { "<leader>T", group = "test" },
  { "<leader>b", group = "buffer" },
  { "<leader>d", group = "debug" },
  { "<leader>g", group = "git" },
  { "<leader>l", group = "LSP" },
  { "<leader>l_", hidden = true },
  { "<leader>o", group = "open" },
  { "<leader>p", group = "plugins" },
  { "<leader>s", group = "search" },
  { "<leader>t", group = "toggle" },
  { "<leader>t_", hidden = true },
  { "<leader>v", "<cmd>vsplit<CR>", desc = "vertical split" },
  { "<leader>w", group = "window" },
  { "<leader>x", group = "diagnostics/quickfix" },
  { "[", group = "prev" },
  { "]", group = "next" },
  { "g", group = "goto" },
}
