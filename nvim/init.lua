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
spec "user.illuminate" -- Automatically highlighting other uses of the word under the cursor
spec "user.gitsigns"
spec "user.whichkey"
spec "user.nvimtree"
spec "user.lualine"
spec "user.navic" -- Statusline/winbar component that uses LSP to show current code context
spec "user.breadcrumbs" -- Works with nvim-navic to provide context about code in the winbar
spec "user.oil"
spec "user.neotest"
spec "user.autopairs"
spec "user.conform" -- Formatting
spec "user.extras.neoscroll" -- Smooth scrolling
spec "user.extras.harpoon" -- Getting you where you want with the fewest keystrokes
spec "user.extras.eyeliner" -- Move faster with unique f/F indicators for each word on the line
spec "user.extras.neotab" -- Tabbing in and out of brackets, parentheses, quotes, and more
require "user.lazy"
