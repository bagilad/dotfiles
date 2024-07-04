local icons = require "config.icons"
local opt = vim.opt

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
-- opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.pumblend = 10
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 1 -- always show tabs
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 100 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.relativenumber = true -- set relative numbered lines
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 0
opt.sidescrolloff = 8
opt.title = false
-- colorcolumn = "80",
opt.colorcolumn = "120"
opt.fillchars = opt.fillchars + "eob: "
opt.fillchars:append {
  stl = " ",
}
opt.list = true -- enable the below listchars
opt.listchars = {
  eol = icons.ui.EndOfLine,
  tab = "▸ ",
  trail = icons.ui.CenterDot,
  nbsp = icons.ui.Space,
}

opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldnestmax = 4

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2
