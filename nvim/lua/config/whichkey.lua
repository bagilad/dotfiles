local mappings = {
  ["g"] = { name = "+goto" },
  ["]"] = { name = "+next" },
  ["["] = { name = "+prev" },
  ["<leader>"] = {
    v = { "<cmd>vsplit<CR>", "vertical split" },
    b = { name = "+buffer" },
    d = { name = "+debug" },
    f = { name = "+file/find" },
    s = { name = "+search" },
    g = { name = "+git" },
    gh = { name = "+hunks" },
    l = { name = "+LSP" },
    p = { name = "+plugins" },
    t = { name = "+toggle" },
    o = { name = "+open" },
    T = { name = "+test" },
    w = { name = "+window" },
    x = { name = "+diagnostics/quickfix" },
  },
}

local which_key = require "which-key"

local opts = {
  mode = "n", -- NORMAL mode
  ignore_missing = true,
}

which_key.register(mappings, opts)
