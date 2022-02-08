let g:has_async = v:version >= 800 || has('nvim')
call plug#begin('~/.vim/bundle')

Plug 'christoomey/vim-run-interactive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'janko-m/vim-test'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/tComment'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" FZF for file searching and other things..
Plug '$HOMEBREW_ROOT/opt/fzf'
Plug 'junegunn/fzf.vim'

" text stuff
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'bkad/CamelCaseMotion'
Plug 'kana/vim-textobj-line' " Adds 'il' and 'al'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'

" searching
Plug 'mileszs/ack.vim'
Plug 'haya14busa/incsearch.vim'

" find, replace with odd plurals and caps, eg ":%S/dog{,s}/child{,ren}/g"
Plug 'tpope/vim-abolish'

" multi-char "f" command using "s"
" disabled while I figure out if I want to use
" Plug 'justinmk/vim-sneak'
" repeat f, F, t, T to match next. Supports across lines
" Plug 'rhysd/clever-f.vim'

" auto-apply editorconfig settings on save
Plug 'editorconfig/editorconfig-vim'

" Run Prettier on save
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
\}

" code expansion via shortcuts
Plug 'mattn/emmet-vim'

" git status in gutter
Plug 'airblade/vim-gitgutter'

" comment/uncomment code blocks
Plug 'scrooloose/nerdcommenter'

" nerdtree file tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" resize current window to be at least 80 char wide
Plug 'justincampbell/vim-eighties'

" markdown/zen writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'M4R7iNP/vim-inky'

" gS and gJ to switch between single and multi-line
Plug 'AndrewRadev/splitjoin.vim'

" snippets support and snippet repo
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" tmux integration
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
endif

" required for deplete, only necessary if doesn't have async
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Tree-sitter for better syntax highlighting, parsing
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" language grammars
Plug 'mxw/vim-jsx'
Plug 'rhysd/vim-crystal'
Plug 'leafgarland/typescript-vim'
Plug 'keith/swift.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" syntax themes
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'connorholyday/vim-snazzy'

if g:has_async
  Plug 'w0rp/ale'
endif

call plug#end()
