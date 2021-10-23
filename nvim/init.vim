" VIM-Plug {{{
if !exists('g:vscode')
    call plug#begin('~/.config/nvim/plugged')
    " Coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" coc {{{
if !exists('g:vscode')
    " See example configuration in https://github.com/neoclide/coc.nvim
    "
    " TextEdit might fail if hidden is not set.
    " set hidden

    " Some servers have issues with backup files, see #649.
    " set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("nvim-0.5.0") || has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

    " See https://github.com/neoclide/coc.nvim/wiki/Using-workspaceFolders#resolve-workspace-folder
    autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
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
