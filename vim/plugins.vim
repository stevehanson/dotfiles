" Plugin-specific settings go here

" == Ag ===================================================================

if !exists(":Ag")
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
end

" == Airline ===================================================================

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_x = '' " Don't show file type
let g:airline_section_z = airline#section#create(['linenr', ':%2v'])
let g:airline#extensions#hunks#enabled = 0 " Turn off the git file status
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#formatter = 'default'

" == ALE =======================================================================

let g:ale_fixers = {
      \   'javascript': ['eslint', 'prettier'],
      \   'ruby': ['rubocop'],
      \}
let g:ale_linters = {
      \   'javascript': ['eslint', 'prettier'],
      \   'ruby': ['ruby'],
      \}

let g:ale_javascript_prettier_use_local_config = 1
nnoremap <leader>ff :ALEFix<CR>

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" == Auto Pairs ================================================================
"
" Note: To insert quote/paren without auto-match, type C-v first or can usually
" use vim-surround instead with visual selection and "S"

" == Ctrl-P ====================================================================

" List open buffers
nnoremap <C-b> :CtrlPBuffer<cr>

let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
let g:ctrlp_use_caching = 0

" == Deoplete ==================================================================

let g:deoplete#enable_at_startup = 1
" call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

" == Emmet =====================================================================

" Enable Emmet in all modes
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

" == FZF =======================================================================

nmap <silent> <leader>P :GFiles<CR>
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" == Inc Search ================================================================

" Map vim commands to go through inc-search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch " clear search results highlight after search
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" == MatchIt ===================================================================

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" == NERDCommenter =============================================================

" Command-/ to toggle comments
nnoremap <C-_> <plug>NERDCommenterToggle
vnoremap <C-_> <plug>NERDCommenterToggle

" == NERDTree ==================================================================

" Open current file in NERDTree
nnoremap <C-t> :NERDTreeFind<CR>

silent! nunmap <C-\>
nnoremap <C-\> :NERDTreeClose<CR>

let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeMinimalUI = 1         " don't show help at top
let NERDTreeAutoDeleteBuffer = 1  " auto-close buffers after delete

" Start Nerdtree automatically when vim starts if no files specified
" Note: best to start with `vim`, not `vim .`
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter *
  \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
  \   q |
  \ endif

" == Tmuxline ==================================================================

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '#(tmux-spotify-info)',
      \'z'    : '%a %R',
      \'options': { 'status-justify': 'left' }}

" == Vim-Test ==================================================================

nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

if exists('$TMUX')
  let g:test#strategy = 'vimux' " run tests in a split tmux pane if available
  let g:VimuxUseNearest = 0     " open test panes in new pane

  " zoom the runner
  map <Leader>vz :VimuxZoomRunner<CR>

  " close runner
  map <Leader>vq :VimuxCloseRunner<CR>
elseif has('nvim')
  let test#strategy = "neovim"
endif

" == Ultisnips =================================================================

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippet"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" == Vim Eighties ==============================================================

let g:eighties_extra_width = 1 " Add some extra room

" == Vim Multiple Cursors ======================================================

" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
  if exists('*deoplete#disable')
    exe 'call deoplete#disable()'
  elseif exists(':NeoCompleteLock') == 2
    exe 'NeoCompleteLock'
  endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
  if exists('*deoplete#toggle')
    exe 'call deoplete#toggle()'
  elseif exists(':NeoCompleteUnlock') == 2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" == Vim Run Interactive =======================================================

nnoremap <Leader>r :RunInInteractiveShell<Space>
