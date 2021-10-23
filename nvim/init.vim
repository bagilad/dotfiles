" VIM-Plug {{{
if !exists('g:vscode')
    call plug#begin('~/.config/nvim/plugged')
    " lspconfig
    Plug 'neovim/nvim-lspconfig'
    Plug 'simrat39/rust-tools.nvim'
    " nvim-cmp {{{
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    " For luasnip users.
    " Plug 'L3MON4D3/LuaSnip'
    " Plug 'saadparwaiz1/cmp_luasnip'

    " For ultisnips users.
    " Plug 'SirVer/ultisnips'
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    " For snippy users.
    " Plug 'dcampos/nvim-snippy'
    " Plug 'dcampos/cmp-snippy'
    " }}}
    " Scala
    Plug 'derekwyatt/vim-scala'
    " R
    " Plug 'jalvesaq/Nvim-R'
    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    " GoLang
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'elzr/vim-json'
    Plug 'chrisbra/csv.vim'
    Plug 'GEverding/vim-hocon'
    " For Clojure {{{
    Plug 'tpope/vim-dispatch'
    Plug 'clojure-vim/vim-jack-in'
    " Only in Neovim:
    Plug 'radenling/vim-dispatch-neovim'
    Plug 'Olical/conjure', {'tag': 'v4.23.0'}
    " Plug 'guns/vim-clojure-highlight'
    " Plug 'guns/vim-clojure-static'
    " Plug 'thinca/vim-ft-clojure'
    Plug 'guns/vim-sexp'
    Plug 'tpope/vim-sexp-mappings-for-regular-people'
    " }}}
    " Provides automatic closing of quotes, parenthesis, brackets, etc.
    Plug 'Raimondi/delimitMate'
    Plug 'scrooloose/nerdtree'
    " Theme {{{
    Plug 'morhetz/gruvbox'
    " For Airline
    Plug 'jacoborus/tender.vim'
    "Plug 'connorholyday/vim-snazzy'
    " }}}
    " Commenting
    Plug 'tomtom/tcomment_vim'
    " Required for tcomment_vim
    Plug 'tomtom/tlib_vim'
    Plug 'vim-airline/vim-airline'
    " Colored Parentheses
    Plug 'luochen1990/rainbow'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    " Mappings for toggling
    Plug 'tpope/vim-unimpaired'
    " A Git wrapper
    Plug 'tpope/vim-fugitive'
    " Adds file type icons to Vim plugins such as: NERDTree, vim-airline,...
    Plug 'ryanoasis/vim-devicons'
    " Provides fancy start screen
    Plug 'mhinz/vim-startify'

    " See https://oli.me.uk/getting-started-with-clojure-neovim-and-conjure-in-minutes/
    Plug 'easymotion/vim-easymotion'
    Plug 'ncm2/float-preview.nvim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

    call plug#end()
endif
" }}}
"" Basic options {{{
if !exists('g:vscode')
    let g:python_host_prog='/usr/bin/python'
    let g:python3_host_prog='/usr/local/bin/python3'
    set termguicolors
    set modelines=0
    set ts=4
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set encoding=utf-8
    set scrolloff=3
    set autoindent
    set showmode
    set showcmd
    set hidden
    set wildmenu
    set wildmode=list:longest
    set ttyfast
    set ruler
    set backspace=indent,eol,start
    set laststatus=2
    set ignorecase
    set smartcase
    set incsearch
    set showmatch
    set hlsearch
    set formatoptions=l
    set lbr
    set number
    set gdefault
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
    set ofu=syntaxcomplete#Complete
    set guioptions-=t
    set guioptions-=l
    set guioptions-=r
    set guioptions-=b
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=R
    set guioptions-=B
    set guioptions-=M
    set nobackup
    set noswapfile
    set virtualedit=block
    set splitbelow
    set splitright
    set lsp=1
    set relativenumber
    set timeoutlen=1000 ttimeoutlen=0
    " Better Completion
    set complete=.,w,b,u,t
    set completeopt=longest,menuone,preview
    if getcwd() == $HOME
        if !empty($PROJECTS_DIR)
            cd $PROJECTS_DIR
        endif
    endif
    set noautoread

    set mouse=a

    " Treat dash separated words as a word text-object
    set iskeyword+=-
    " Save when losing focus
    au FocusLost * :silent! wall

    " Resize splits when the window is resized
    au VimResized * :wincmd =

    " Refresh current buffer if file changed
    autocmd BufEnter,FocusGained * checktime

    "Disabling concealing json syntax by default
    let g:vim_json_syntax_conceal = 0

    " display a ruler at a specific line
    set colorcolumn=80
endif
let mapleader=","
let maplocalleader="\\"
set nocompatible
" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif
" }}}

" Key Mappings {{{
nnoremap <leader><space> :nohlsearch<CR> 
if !exists('g:vscode')
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
endif
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

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'r_language_server' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
            }
        }
end
EOF
" }}}

" rust-tools {{{
lua <<EOF
 require('rust-tools').setup({})
EOF
" }}}

" vim-clap {{{
if !exists('g:vscode')
    let g:clap_provider_grep_delay = 50
    let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'

    nnoremap <space>* :Clap grep ++query=<cword><cr>
    nnoremap <leader>fg :Clap grep<cr>
    nnoremap <leader>ff :Clap files --hidden<cr>
    nnoremap <leader>fb :Clap buffers<cr>
    nnoremap <leader>fw :Clap windows<cr>
    nnoremap <leader>fr :Clap history<cr>
    nnoremap <leader>fh :Clap command_history<cr>
    nnoremap <leader>fj :Clap jumps<cr>
    nnoremap <leader>fl :Clap blines<cr>
    nnoremap <leader>fL :Clap lines<cr>
    nnoremap <leader>ft :Clap filetypes<cr>
    nnoremap <leader>fm :Clap marks<cr>
endif
" }}}

" NerdTree {{{
if !exists('g:vscode')
    let NERDTreeIgnore = ['\.pyc$', '\.orig$']	
    let NERDTreeQuitOnOpen=1

    " returns true if is NERDTree open/active
    function! NTisNTOpen()        
        return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    endfunction

    function! NTImprovedToggle()
        if NTisNTOpen()
            NERDTreeClose
        else
            if @% == ""
                NERDTreeToggle                      
            else                                    
                NERDTreeFind                        
            endif   
        endif
    endfunction
    nnoremap <leader><leader>o :call NTImprovedToggle()<CR>
endif
" }}}

" Vim {{{
if !exists('g:vscode')

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
endif
" }}}

" float-preview {{{
if !exists('g:vscode')
    let g:float_preview#docked = 0
    let g:float_preview#max_width = 80
    let g:float_preview#max_height = 40
endif
" }}}

" Wildmenu completion {{{
if !exists('g:vscode')

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
    set completeopt=longest,menuone,preview
    " <CR>: close popup and save indent.
    " inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" }}}

" Colors and fonts {{{
if !exists('g:vscode')
    syntax on
    set termguicolors
    let g:gruvbox_italic=1
    colorscheme gruvbox

    " " Airline
    let g:airline_theme = 'tender'
    let g:airline_powerline_fonts = 1
    " let g:airline#extensions#whitespace#enabled = 0

    " Highlight VCS conflict markers
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
endif
" }}}

" Yaml {{{
if !exists('g:vscode')
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif
"}}}


" R {{{
if !exists('g:vscode')
    " For more information, see :help ft-r-indent
    let r_indent_align_args = 0
    " indent 2 spaces instead of 4
    autocmd FileType r setlocal sw=2
endif
" }}}
" Scala {{{
if !exists('g:vscode')
    au BufRead,BufNewFile *.sbt set filetype=scala
endif
" }}}
" Rainbow Parentheses Improved {{{
if !exists('g:vscode')
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
endif
" }}}
" Line Return {{{
if !exists('g:vscode')

    " Make sure Vim returns to the same line when you reopen a file.
    " Thanks, Amit
    augroup line_return
        au!
        au BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \     execute 'normal! g`"zvzz' |
                    \ endif
    augroup END
endif
" }}}
" WebDevIcons {{{
if !exists('g:vscode')
    " loading the plugin 
    let g:webdevicons_enable = 1

    " adding the flags to NERDTree 
    let g:webdevicons_enable_nerdtree = 1

    " adding the custom source to unite 
    let g:webdevicons_enable_unite = 1

    " " adding to vim-airline's tabline 
    " let g:webdevicons_enable_airline_tabline = 1
    "
    " " adding to vim-airline's statusline 
    " let g:webdevicons_enable_airline_statusline = 1

    " ctrlp glyphs
    let g:webdevicons_enable_ctrlp = 1

    " turn on/off file node glyph decorations (not particularly useful)
    let g:WebDevIconsUnicodeDecorateFileNodes = 1

    " use double-width(1) or single-width(0) glyphs 
    " only manipulates padding, has no effect on terminal or set(guifont) font
    let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

    " whether or not to show the nerdtree brackets around flags 
    let g:webdevicons_conceal_nerdtree_brackets = 1

    " the amount of space to use after the glyph character (default ' ')
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

    " Force extra padding in NERDTree so that the filetype icons line up vertically 
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
endif
"}}}
" Startify    {{{
if !exists('g:vscode')
    let g:startify_change_to_dir = 0
endif
"}}}
