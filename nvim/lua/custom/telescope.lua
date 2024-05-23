local builtin = require "telescope.builtin"
local set = vim.keymap.set
set("n", "<leader>bb", builtin.buffers, { desc = "Find" })
set("n", "<leader>fb", builtin.git_branches, { desc = "Git Branches" })
set("n", "<leader>fc", builtin.colorscheme, { desc = "Colorscheme" })
set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
set("n", "<leader>ft", builtin.live_grep, { desc = "Find Text" })
set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
set("n", "<leader>fl", builtin.resume, { desc = "Last Search" })
set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
set("n", "<space>fn", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "Config Files" })

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
