" VIM-Plug {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'

" Scala
Plug 'derekwyatt/vim-scala'
" R
Plug 'jalvesaq/Nvim-R'
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
Plug 'Olical/conjure', {'tag': 'v4.18.0'}
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
Plug 'dense-analysis/ale'
Plug 'liuchengxu/vim-clap'

call plug#end()

" }}}
" Basic options {{{
let mapleader=","
let maplocalleader="\\"
let g:python_host_prog='/usr/bin/python'
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
" }}}

" Key Mappings {{{
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :nohlsearch<CR> 
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

" vim-clap {{{
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
nnoremap <leader><leader>o :call NTImprovedToggle()<CR>

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

" ALE {{{
"let g:ale_open_list=1
"let g:ale_lint_on_insert_leave=1
"let g:ale_lint_on_text_changed='normal'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
"let g:ale_lint_on_text_changed = 'never'
let g:ale_python_flake8_args = '--ignore=E --select=E128'
let g:ale_linters = {
\   'clojure': ['clj-kondo'],
\   'scala': ['scalac'],
\}
"let g:ale_linters_explicit = 1

" }}}

" deoplete {{{
let g:acp_enableAtStartup = 0
let g:deoplete#enable_at_startup = 1 
let g:necoghc_enable_detailed_browse = 1
let g:deoplete#disable_auto_complete=0
let g:deoplete#auto_completion_start_length=3
let g:haskellmode_completion_ghc = 1
autocmd CompleteDone * pclose
autocmd FileType python setlocal omnifunc=jedi#completions
set completeopt+=noselect
call deoplete#custom#option('keyword_patterns', {
            \ 'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*',
            \})
" Use tab to select completion.
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
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
set completeopt=longest,menuone,preview
" <CR>: close popup and save indent.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" }}}

" Colors and fonts {{{
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
" }}}

" Yaml {{{
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"}}}


" R {{{
" For more information, see :help ft-r-indent
let r_indent_align_args = 0
" indent 2 spaces instead of 4
autocmd FileType r setlocal sw=2
" }}}
" Scala {{{
au BufRead,BufNewFile *.sbt set filetype=scala

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
" Startify    {{{
let g:startify_change_to_dir = 0
"}}}
