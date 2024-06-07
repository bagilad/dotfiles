local actions = require "telescope.actions"

require("telescope").setup {
  pickers = {
    buffers = {
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },

    lsp_references = {
      initial_mode = "normal",
    },

    lsp_definitions = {
      initial_mode = "normal",
    },

    corscheme = {
      enable_preview = true,
    },

    lsp_declarations = {
      initial_mode = "normal",
    },

    lsp_implementations = {
      initial_mode = "normal",
    },
  },
  extensions = {
    fzf = {},
  },
}
