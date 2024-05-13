require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
spec "user.colorscheme"
spec "user.devicons"
spec "user.treesitter"
spec "user.mason"
spec "user.schemastore"
spec "user.lspconfig"
spec "user.cmp"
spec "user.telescope"
spec "user.none-ls"
-- Automatically highlighting other uses of the word under the cursor
spec "user.illuminate"
spec "user.gitsigns"
spec "user.whichkey"
spec "user.nvimtree"
spec "user.lualine"
-- Statusline/winbar component that uses LSP to show current code context
spec "user.navic"
-- Works with nvim-navic to provide context about code in the winbar
spec "user.breadcrumbs"
spec "user.oil"
spec "user.neotest"
spec "user.autopairs"
-- Smooth scrolling
spec "user.extras.neoscroll"
-- Getting you where you want with the fewest keystrokes
spec "user.extras.harpoon"
-- Move faster with unique f/F indicators for each word on the line
spec "user.extras.eyeliner"
-- Tabbing in and out of brackets, parentheses, quotes, and more
spec "user.extras.neotab"
require "user.lazy"
