local mappings = {
  ["g"] = { name = "+goto" },
  ["]"] = { name = "+next" },
  ["["] = { name = "+prev" },
  ["<leader>"] = {
    v = { "<cmd>vsplit<CR>", "vertical split" },
    b = { name = "+buffer" },
    d = { name = "+debug" },
    s = { name = "+search" },
    g = { name = "+git" },
    -- gh = { name = "+hunks", ["_"] = "which_key_ignore" },
    l = { name = "+LSP", ["_"] = "which_key_ignore" },
    p = { name = "+plugins" },
    t = { name = "+toggle", ["_"] = "which_key_ignore" },
    o = { name = "+open" },
    T = { name = "+test" },
    w = { name = "+window" },
    x = { name = "+diagnostics/quickfix" },
  },
}

local which_key = require "which-key"

local opts = {
  mode = "n", -- NORMAL mode
}

which_key.register(mappings, opts)
