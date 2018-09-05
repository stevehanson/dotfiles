"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Remove "|" char in file split, change bg color
set fillchars+=vert:\ 
hi VertSplit ctermfg=236 ctermbg=236 guibg=#292B31

augroup shanson_theme
  autocmd!

  " Make Functions bold -- affects JS but not Ruby due to syntax limitations :(
  autocmd ColorScheme * call onedark#extend_highlight("Function", { "cterm": "bold", "gui": "bold" })
augroup END

let g:onedark_terminal_italics=1
colorscheme onedark

" Make comments italic
highlight Comment cterm=italic

" Make functions bold
highlight Function cterm=bold

" Make the 80 character column dark gray
highlight ColorColumn ctermbg=239
