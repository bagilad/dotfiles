lua require('plugins')

"" Basic options {{{
" let g:python_host_prog='/usr/bin/python'
" let g:python3_host_prog='/usr/local/bin/python3'
set termguicolors
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=3
set backspace=2
set ignorecase
set smartcase
set showmatch
set formatoptions=l
set lbr
set number
set nobackup
set noswapfile
set splitbelow
set splitright
set relativenumber
if getcwd() == $HOME
    if !empty($PROJECTS_DIR)
        cd $PROJECTS_DIR
    endif
endif

set mouse=a

" Treat dash separated words as a word text-object
set iskeyword+=-
" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Refresh current buffer if file changed
autocmd BufEnter,FocusGained * checktime

" display a ruler at a specific line
set colorcolumn=80
set list
set listchars=tab:▸\ ,eol:↲,trail:·
let mapleader=","
let maplocalleader="\\"
" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif
" }}}

" Key Mappings {{{
nnoremap <leader><space> :nohlsearch<CR>
nnoremap / /\v
vnoremap / /\v
" Open init.vim in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source init.vim
nnoremap <leader>sv :source $MYVIMRC<cr>
" Uppercase current word in insert mode
inoremap <c-u> <esc>viwUea
" Write the letter λ
inoremap <c-l> <c-k>l*
" Use Escape to exit terminal mode
tnoremap <Esc> <C-\><C-n>
" }}}

" nvim-cmp {{{
set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
    expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
end,
},
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        },
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    }, {
    { name = 'buffer' },
    })
})
EOF
" }}}

" nvim-lspconfig {{{
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

-- Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = true,
    -- delay update diagnostics
    update_in_insert = false,
    -- display_diagnostic_autocmds = { "InsertLeave" },
    }
)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'r_language_server' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
            }
        }
end

local rust_opts = {
    tools = { -- rust-tools options
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
        show_parameter_hints = false,
        parameter_hints_prefix = "",
        other_hints_prefix = "",
        },
    },

-- all the opts to send to nvim-lspconfig
-- these override the defaults set by rust-tools.nvim
-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
server = {
    on_attach = on_attach,
    settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
                command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(rust_opts)

EOF
" }}}

" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
-- ignore_install = { "javascript" }, -- List of parsers to ignore installing
highlight = {
enable = true,              -- false will disable the whole extension
-- disable = { "c", "rust" },  -- list of language that will be disabled

-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- Using this option may slow down your editor, and you may see some duplicate highlights.
-- Instead of true it can also be a list of languages
additional_vim_regex_highlighting = false,
},
  indent = {
  enable = true,
  },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}}

" gitsigns {{{
lua <<EOF
require('gitsigns').setup()
EOF
" }}}

" telescope {{{
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
"}}}

" Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif
" }}}

" float-preview {{{
let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40
" }}}

" Wildmenu completion {{{

set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
" Disable preview scratch window
" <CR>: close popup and save indent.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }}}

" Colors and fonts {{{
let g:gruvbox_italic=1
colorscheme gruvbox
lua << EOF
require'lualine'.setup {
    options = {theme = 'gruvbox'}
    }
EOF

lua << EOF
function _G.webDevIcons(path)
    local filename = vim.fn.fnamemodify(path, ':t')
    local extension = vim.fn.fnamemodify(path, ':e')
    return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end
EOF
function! StartifyEntryFormat() abort
    return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction
" }}}

" Yaml {{{
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"}}}
