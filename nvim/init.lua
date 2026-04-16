vim.g.mapleader = ' ' -- must be set before plugins/mappings

-- PLUGINS --------------------------------------------------------------------

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/stevearc/conform.nvim',
  -- 'https://github.com/folke/tokyonight.nvim',
  -- 'https://github.com/catppuccin/nvim',
  'https://github.com/rebelot/kanagawa.nvim',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/echasnovski/mini.files',
  'https://github.com/neovim-treesitter/treesitter-parser-registry',
  'https://github.com/neovim-treesitter/nvim-treesitter',
})

-- vim.cmd.colorscheme('tokyonight')
-- vim.cmd.colorscheme('catppuccin')
vim.cmd.colorscheme('kanagawa')

-- built-in quickfix filter (no install needed)
vim.cmd.packadd('cfilter')

-- LSP ------------------------------------------------------------------------

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
})

vim.lsp.enable('lua_ls')

vim.lsp.config('vtsls', {
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
    },
  },
})

vim.lsp.enable('vtsls')

vim.lsp.config('eslint', {
  settings = {
    workingDirectory = { mode = 'auto' },
  },
})

vim.lsp.enable('eslint')

vim.lsp.enable('prismals')

vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      schemaStore = { enable = true, url = 'https://www.schemastore.org/api/json/catalog.json' },
      validate = true,
    },
  },
})
vim.lsp.enable('yamlls')

-- FORMATTING -----------------------------------------------------------------

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    typescript = { 'prettier' },
    javascript = { 'prettier' },
    typescriptreact = { 'prettier' },
    javascriptreact = { 'prettier' },
    yaml = { 'prettier' },
    prisma = { 'prisma' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})

-- OPTIONS --------------------------------------------------------------------

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.smoothscroll = true
vim.o.wrap = false
vim.o.signcolumn = 'yes'
vim.o.updatetime = 200

-- Editing
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.swapfile = false
vim.o.confirm = true

vim.opt.autocomplete = true
vim.opt.complete:prepend('o')
vim.opt.completeopt:append({ 'menuone', 'fuzzy', 'noselect', 'popup' })

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.wildoptions:append({ 'fuzzy' })
vim.opt.grepprg = 'rg --vimgrep --no-messages --smart-case'

-- Windows
vim.o.splitbelow = true
vim.o.splitright = true

-- FILES ----------------------------------------------------------------------

require('mini.files').setup()

-- GIT ------------------------------------------------------------------------

require('gitsigns').setup({ current_line_blame = true })

-- KEYMAPS --------------------------------------------------------------------

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

vim.keymap.set('n', '<leader>e', function()
  require('mini.files').open(vim.api.nvim_buf_get_name(0))
end, { desc = 'File explorer' })

-- Diagnostic
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = 'Prev diagnostic' })

vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Diagnostic float' })
vim.keymap.set('n', '<leader>le', function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      ---@diagnostic disable-next-line: assign-type-mismatch
      only = { 'source.fixAll.eslint' },
      diagnostics = {},
    },
  })
end, { desc = 'ESLint fix all' })

-- Fuzzy Finder
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua help_tags<cr>', { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fd', '<cmd>FzfLua diagnostics_workspace<cr>', { desc = 'Diagnostics workspace' })

-- Gitsigns
vim.keymap.set('n', ']h', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next hunk' })
vim.keymap.set('n', '[h', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Prev hunk' })
vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>', { desc = 'Reset hunk' })

-- AUTOCOMMANDS ---------------------------------------------------------------

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Start treesitter and fix formatoptions',
  callback = function()
    -- Enable tree-sitter highlighting for any filetype that has a parser installed
    pcall(vim.treesitter.start)
    -- don't auto-insert comment leader on Enter or o/O
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

local lsp_group = vim.api.nvim_create_augroup('lsp', {})

-- When an LSP attaches: show sign column and enable built-in LSP completion
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_group,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    if client:supports_method('textDocument/documentHighlight') then
      local group = vim.api.nvim_create_augroup('lsp_highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = args.buf,
        group = group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        buffer = args.buf,
        group = group,
        callback = vim.lsp.buf.clear_references,
      })
    end
    local map = function(key, fn, desc)
      vim.keymap.set('n', key, fn, { buffer = args.buf, desc = desc })
    end
    map('K', vim.lsp.buf.hover, 'Hover')
    map('gd', '<cmd>FzfLua lsp_definitions<cr>', 'Go to definition')
    map('gr', '<cmd>FzfLua lsp_references<cr>', 'References')
    map('gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('<leader>lr', vim.lsp.buf.rename, 'Rename')
    map('<leader>la', vim.lsp.buf.code_action, 'Code action')
    map('<leader>ls', '<cmd>FzfLua lsp_workspace_symbols<cr>', 'Workspace symbols')
    vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get, { buffer = args.buf, desc = 'Trigger completion' })
  end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanked text',
  callback = function()
    vim.highlight.on_yank()
  end,
})
