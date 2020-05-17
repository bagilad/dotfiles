" VIM-Plug {{{
call plug#begin('~/.config/nvim/plugged')
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Scala
Plug 'derekwyatt/vim-scala'
" R
Plug 'jalvesaq/Nvim-R'
" GoLang
Plug 'fatih/vim-go'
" For Clojure {{{
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'thinca/vim-ft-clojure'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" kibit is a static code analyzer for Clojure
" vim-kibit allows you to analyze the current opened file by running :Kibit
Plug 'humorless/vim-kibit'
" Plug 'clojure-vim/async-clj-omni'
" }}}
Plug 'elzr/vim-json'
Plug 'chrisbra/csv.vim'
Plug 'GEverding/vim-hocon'
" Provides an easy access to a list of recently opened/edited files.
Plug 'vim-scripts/mru.vim'
" For listing and switching buffers, windows and tabs.
Plug 'sandeepcr529/Buffet.vim'
" Provides automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
" Theme {{{
"Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
" For Airline
" Plug 'jacoborus/tender.vim'
"Plug 'connorholyday/vim-snazzy'
" }}}
" Commenting
Plug 'tomtom/tcomment_vim'
" Required for tcomment_vim
Plug 'tomtom/tlib_vim'
" A vim library to interpret a file by function and cache file automatically.
" Plug 'vim-scripts/vim-addon-mw-utils'
" Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/eleline.vim'
" Colored Parentheses
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-repeat'
"Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
" Mappings for toggling
Plug 'tpope/vim-unimpaired'
" A Git wrapper
Plug 'tpope/vim-fugitive'
" Adds file type icons to Vim plugins such as: NERDTree, vim-airline,...
Plug 'ryanoasis/vim-devicons'
" A simple plugin that helps to end certain structures automatically
" Plug 'tpope/vim-endwise'
Plug 'bfredl/nvim-miniyank'
" Jump to any location specified by two characters (e.g., sab)
Plug 'justinmk/vim-sneak'
" Provides fancy start screen
Plug 'mhinz/vim-startify'
" FZF for file navigation
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" }}}
" Basic options {{{
let mapleader=","
let g:python_host_prog='/usr/local/bin/python'
let g:python3_host_prog='/usr/local/bin/python3'
set nocompatible
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
set relativenumber
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
set nowritebackup
set noswapfile
set virtualedit=block
set splitbelow
set splitright
set lsp=1
set timeoutlen=1000 ttimeoutlen=0
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
" }}}

" ======== Coc.nvim {{{
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygnoup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" Trailing whitespace  {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}
" Wildmenu completion {{{

set wildmenu
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

" }}}
" Key Mapping {{{
noremap <leader>j :%!python -m json.tool<CR>
nnoremap Y y$
nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap j gj
nnoremap k gk
" nnoremap <C-a> ^
" nnoremap <C-e> $
nnoremap <up> g<up>
nnoremap <down> g<down>
"
"Show hidden chars
nmap <C-h> :set list!<CR>

" Map Ctrl-t to open a new editor tab, Ctrl-j and Ctrl-k for tab navigation
nmap <C-t> :tabnew<CR>
nmap <C-left> :tabprevious<CR>
nmap <C-right> :tabnext<CR>

noremap <C-up> {zz
noremap <C-down> }zz
map <leader>ve :e $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>
" Resizing
map <silent> <A-left> 5<C-w><
map <silent> <A-down> 5<C-W>-
map <silent> <A-up> 5<C-W>+
map <silent> <A-right> 5<C-w>> 
" Clean trailing whitespace
nnoremap <leader>cw mz:%s/\s\+$//<cr>:let @/=''<cr>`z
" Keep the cursor in place while joining lines
nnoremap J mzJ`z
" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" Made D behave
nnoremap D d$
nmap gV `[v`]
" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*<c-o>:call winrestview(stay_star_view)<cr>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz
" Buffers
noremap <silent> qq :Bufferlist<CR>
" nnoremap <silent> <Leader>b :TagbarToggle<CR>
" Switches to a previously open buffer and attempts to delete the buffer
" I worked on
" (https://stackoverflow.com/questions/4298910/vim-close-buffer-but-not-split-window)
nmap ,d :b#<bar>bd#<CR>
" }}}
" Colors and fonts {{{
syntax on
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

" let g:jellybeans_use_gui_italics = 0
" let g:jellybeans_overrides = {
"            \    'MatchParen': {'guifg': 'ccff04',
"            \                   'guibg': 'None',
"            \                   'gui': 'BOLD', 
"            \                   'cterm': 'BOLD', 
"            \                   'ctermfg': '226',
"            \                   'ctermbg': 'None',
"            \                   'attr': 'bold'},
"            \   'Search': {     'gui': 'UNDERLINE', 
"            \                   'cterm': 'UNDERLINE', 
"            \                   'guifg': '95BDAE',
"            \                   'guibg': '603D36',
"            \                   'attr': 'underline'}
"            \}
"
" set background=dark
" colorscheme jellybeans

" set gfn=InconsolataGo\ Nerd\ Font:h19

" " Airline
" let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#whitespace#enabled = 0

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}
" NerdTree {{{
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
nmap <leader><leader>o :call NTImprovedToggle()<CR>

" }}}
" Folding {{{

set foldlevelstart=0

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}
" Clojure  {{{
set lispwords+=ns,if-not,match,when-not,defstate,go-loop
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^if-not', '^go-loop']
let g:clojure_fold_extra = [
            \ 'defgauge',
            \ 'defmeter',
            \ 'defhistogram',
            \ 'defcounter',
            \ 'deftimer',
            \
            \ 'defdb',
            \ 'defentity',
            \ 'defaspect',
            \ 'add-aspect',
            \ 'defmigration',
            \
            \ 'defsynth',
            \ 'definst',
            \ 'defproject',
            \
            \ 'defroutes',
            \
            \ 'defrec',
            \
            \ 'defparser',
            \
            \ 'defform',
            \ 'defform-',
            \
            \ 'defpage',
            \ 'defsketch'
            \
            \ ]

let g:clojure_highlight_extra_defs = [
            \ 'defparser',
            \ 'deftest',
            \ 'match',
            \
            \ 'defproject',
            \
            \ 'defroutes'
            \ ]

let g:clojure_conceal_extras = 1
set wildignore+=classes
set wildignore+=lib
augroup ft_clojure
    au!

    au BufNewFile,BufRead riemann.config set filetype=clojure
    au FileType clojure silent! call TurnOnClojureFolding()
    "au FileType clojure compiler clojure
    au FileType clojure setlocal report=100000

    " Indent top-level form.
    au FileType clojure nmap <buffer> <localleader>= mz99[(v%='z
    " ])
augroup END
au FileType clojure let loaded_delimitMate = 0
autocmd FileType clojure nnoremap <buffer> <silent> <leader>rx :Eval (do (require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/set-refresh-dirs "src/clj" "src/cljc") (clojure.tools.namespace.repl/refresh))<cr>

" }}}
" R {{{
" For more information, see :help ft-r-indent
let r_indent_align_args = 0
" indent 2 spaces instead of 4
autocmd FileType r setlocal sw=2
" }}}
" Scala {{{
au BufRead,BufNewFile *.sbt set filetype=scala

" }}}
" vim-sexp {{{
let maplocalleader=","
" }}}
" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" FZF {{{
" see https://bluz71.github.io/2018/12/04/fuzzy-finding-in-vim-with-fzf.html
"
" Find files
nnoremap <silent> <Leader>f :Files<CR>
" Find files in the current directory (of the open buffer)
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
" Find buffer
nnoremap <silent> <Leader>b :Buffers<CR>
" Display the status of the current Git repository whilst also allowing easy
" navigation to modified files.
nnoremap <silent> <Leader>g :GFiles?<CR>
" Search for tag in project
nnoremap <silent> <Leader>] :Tags<CR>
" Search for tag in open buffer
nnoremap <silent> <Leader>b] :BTags<CR>
" Search commits
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <Leader>c  :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>
" Search in files  
nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>!  :Rg!<Space>

" }}}
" Vim {{{

" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif
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
" Bufferline {{{
let g:bufferline_echo = 0
" }}}
" Rainbow Parentheses Improved {{{
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" }}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" MiniYank  {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
let g:miniyank_filename = $HOME."/.miniyank.mpack"
" }}}
" WebDevIcons {{{
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
"}}}
" Sneak    {{{
let g:sneak#s_next = 1
let g:sneak#label = 1
"}}}
" Startify    {{{
let g:startify_change_to_dir = 0
"}}}
