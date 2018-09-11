" ~~~~~~~~~~~~~~~~~~~~~ 🌞 shanson's dotfiles 🌞 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" == General Settings ==========================================================

let mapleader = " "
syntax on

set backspace=2        " Backspace deletes like most programs in insert mode
set ruler              " Show the cursor position all the time
set showcmd            " Display incomplete commands
set incsearch          " Do incremental searching
set laststatus=2       " Always display the status line
set autowrite          " Automatically :write before running commands
set mouse=a            " Allow using the mouse
set clipboard=unnamed  " Use system clipboard
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

" == General key mappings ======================================================

" Note: Look up mappings with `:map`, eg: `:map <C-P>`

" Map jk to escape
inoremap jk <Esc>

" Make j and k work better with wrapped text
nnoremap j gj
nnoremap k gk

" Auto-indent code when pasting with p
nnoremap p p=`]

" Paste last yanked text, even if have deleted since
nnoremap <Leader>p "0p

" Move to end of line, without newline character when in visual mode
" Also use il, al provided by vim-textobj-line for selecting lines
vnoremap $ g_

" Switch tabs
nnoremap <C-[> gT
nnoremap <C-]> gt

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Use arrow keys to resize windows
noremap <Up>    <C-W>+
noremap <Down>  <C-W>-
noremap <Left>  3<C-W><
noremap <Right> 3<C-W>>

" Select whole file
nnoremap <leader>fa ggVG<CR>

" Reformat wrapping for paragraph
nnoremap <leader>q gqip

" Edit/source vimrc
nnoremap <leader>ve :vsplit ~/dotfiles/vimrc<CR>
nnoremap <leader>vs :source $MYVIMRC<CR> \| :noh<CR> \| :echo "vimrc reloaded 🌞"<CR>

" bind K to grep word under cursor
nnoremap K :Ag <C-R><C-W><CR>

" -- Copy file paths to clipboard ----------------------------------------------

" Relative path
nnoremap <leader>cf :let @+=expand("%")<CR>

" rspec command for current file
nnoremap <leader>cr :let @+="rspec " . expand("%")<CR>

" Absolute path
nnoremap <leader>cF :let @+=expand("%:p")<CR>

" Filename, without path
nnoremap <leader>ct :let @+=expand("%:t")<CR>

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
