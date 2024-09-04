" ~~~~~~~~~~~~~~~~~~~~~ 🌞 shanson's dotfiles 🌞 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" == General Settings ==========================================================

let mapleader = " "
syntax on
set nocompatible

set backspace=2        " Backspace deletes like most programs in insert mode
set ruler              " Show the cursor position all the time
set showcmd            " Display incomplete commands
set incsearch          " Do incremental searching
set laststatus=2       " Always display the status line
set autowrite          " Automatically :write before running commands
set autoread           " Automatically reload externally changed files
set mouse=a            " Allow using the mouse
set clipboard=unnamed  " Use system clipboard
set inccommand=nosplit " show preview while searching and replacing
set nojoinspaces       " Use one space, not two, after punctuation.
set number             " Show line numbers
set numberwidth=5      " Consistent width
set textwidth=80       " Wrap at 80 chars
set colorcolumn=+1     " Visual indicator at textwidth
set diffopt+=vertical  " Always use vertical diffs
set complete+=kspell   " Autocomplete with dictionary when spell check is on
set updatetime=750     " Controls update interval (eg. gitgutter) default: 4000
set nobackup
set nowritebackup
set noswapfile
set splitbelow         " Open new horizontal splits below
set splitright         " Open vertical splits to right
set scrolloff=2        " Always show 2 lines above/below cursor
set history=50
set wildmode=list:longest,list:full      " Matching in wildmenu
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set grepprg=rg\ --vimgrep           " Use ripgrep as grep program
set grepformat=%f:%l:%c:%m,%f:%l:%m " Output results: file:line:column:message

filetype plugin indent on        " Detect and load filetypes and indent config
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like block tags
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" == General key mappings ======================================================

" Note: Look up mappings with `:map`, eg: `:map <C-P>`

" -- Insert mode ---------------------------------------------------------------

" Map jk to escape
inoremap jk <Esc>

" -- Visual mode ---------------------------------------------------------------

" Move to end of line, without newline character when in visual mode
" Can also use il, al provided by vim-textobj-line plugin for selecting lines
vnoremap $ g_

" -- Normal mode ---------------------------------------------------------------

" Make j and k work better with wrapped text
nnoremap j gj
nnoremap k gk

" Auto-indent code when pasting with p
nnoremap p p=`]
nnoremap <Leader>fP p

" Paste last yanked text, even if have deleted since
nnoremap <Leader>p "0p

" Move to end of line, without newline character when in visual mode
" Also use il, al provided by vim-textobj-line for selecting lines
vnoremap $ g_

" Switch tabs
nnoremap H gT
nnoremap L gt

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Use arrow keys to resize windows
noremap <Up>    <C-W>+
noremap <Down>  <C-W>-
noremap <Left>  5<C-W><
noremap <Right> 5<C-W>>

" Select whole file
nnoremap <Leader>fa ggVG

" Save/Close buffer
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" New Tab
nnoremap <Leader>nt :tabnew<CR>
nnoremap <Leader>nv :vsp<CR>

" Edit/source vimrc
nnoremap <Leader>ve :vsplit ~/dotfiles/vimrc<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR> \| :noh<CR> \| :echo "vimrc reloaded 🌞"<CR>

" Format JSON
nnoremap <Leader>fj :%!python -m json.tool<CR>ggVG=

" -- Copy file paths to clipboard ----------------------------------------------

" Relative path
nnoremap <Leader>cf :let @+=expand("%")<CR>

" rspec command for current file
nnoremap <Leader>cr :let @+="rspec " . expand("%")<CR>

" Absolute path
nnoremap <Leader>cF :let @+=expand("%:p")<CR>

" Filename, without path
nnoremap <Leader>ct :let @+=expand("%:t")<CR>

" == gvim config ===============================================================

if has('gui')
  set guifont=Meslo\ LG\ L\ for\ Powerline:h15
  set guioptions-=T " Start without the toolbar
  colorscheme slate
end

" == Additional Config Files ===================================================

source ~/.vim/autocmds.vim  " misc autocmds
source ~/.vim/bundles.vim   " vim plugin declarations
source ~/.vim/functions.vim " custom functions
source ~/.vim/plugins.vim   " plugin-specific config
source ~/.vim/theme.vim     " theme customizations

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
" ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
"   ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { },  -- list of language that will be disabled
"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
" }
" EOF
