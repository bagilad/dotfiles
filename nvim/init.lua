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
-- automatically highlighting other uses of the word under the cursor
spec "user.illuminate"
spec "user.whichkey"
spec "user.nvimtree"
spec "user.lualine"
-- statusline/winbar component that uses LSP to show current code context
spec "user.navic"
-- works with nvim-navic to provide context about code in the winbar
spec "user.breadcrumbs"
spec "user.oil"
spec "user.neotest"
-- smooth scrolling
spec "user.extras.neoscroll"
-- Getting you where you want with the fewest keystrokes
spec "user.extras.harpoon"
spec "user.extras.eyeliner"
-- tabbing in and out of brackets, parentheses, quotes, and more
spec "user.extras.neotab"
require "user.lazy"
