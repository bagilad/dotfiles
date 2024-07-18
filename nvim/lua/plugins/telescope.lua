return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-smart-history.nvim",
  },
  keys = {
    { "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Find" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    {
      "<leader>sc",
      function()
        require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
      end,
      desc = "Config Files",
    },
  },
  config = function()
    require "config.telescope"
  end,
}
