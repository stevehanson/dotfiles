" Plugin-specific settings go here

" == Ack.vim ===================================================================

" Search with '\'
nnoremap \ :Ack!<SPACE>

" bind K to grep word under cursor
nnoremap K :Ack! <C-R><C-W><CR>

if executable('ag')
  let g:ackprg = 'rg --vimgrep --pcre2'
endif

" when opening in vertical split, open to the right of NERDTree
let g:ack_mappings = {
      \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

" == Airline ===================================================================

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_x = '' " Don't show file type
let g:airline_section_z = airline#section#create(['linenr', ':%2v'])
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#hunks#enabled = 0 " Turn off the git file status
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#formatter = 'default'

" == ALE =======================================================================

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint', 'prettier'],
      \   'ruby': ['standardrb'],
      \}
let g:ale_linters = {
      \   'javascript': ['eslint', 'prettier'],
      \   'ruby': ['ruby'],
      \}
let g:ale_fix_on_save = 1
let g:ale_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
nnoremap <leader>ff :ALEFix<CR>

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" == Auto Pairs ================================================================
"
" Note: To insert quote/paren without auto-match, type C-v first or can usually
" use vim-surround instead with visual selection and "S"

" == CamelCaseMotion ===========================================================

omap <silent> i_ <Plug>CamelCaseMotion_iw
xmap <silent> i_ <Plug>CamelCaseMotion_iw

" == Ctrl-P ====================================================================

" disable completely for now in favor of fzf
let g:loaded_ctrlp = 1
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

nnoremap <C-b> :Buffers<cr>
nnoremap <C-p> :Files<cr>
nnoremap <C-g> :GFiles?<cr>
nnoremap <C-f> :Ag<CR>

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

" To disable preview window, use empty string
let g:fzf_preview_window = 'right:60%'
let g:fzf_files_options = '--reverse'
let g:fzf_preview_window = ''
let g:fzf_layout = { 'window': { 'yoffset': 0.1, 'width': 0.6, 'height': 0.4 } }

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-j> <plug>(fzf-complete-path)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

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

nnoremap <leader>nc :NERDTreeClose<CR>

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

" == Prettier ==================================================================

let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" == SplitJoin =================================================================

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_trailing_comma = 1
let g:splitjoin_ruby_options_as_arguments = 1

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
let test#ruby#rspec#executable = 'bundle exec rspec'

if exists('$TMUX')
  let g:test#strategy = 'vimux' " run tests in a split tmux pane if available
  let g:VimuxUseNearest = 0     " open test panes in new pane
elseif has('nvim')
  let test#strategy = "neovim"
endif

" == Vimux =====================================================================

map <Leader>vo :call VimuxOpenRunner()<CR>
" then unzoom by navigating out of it
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>

" == Ultisnips =================================================================

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippet"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" == Vim Eighties ==============================================================
let g:eighties_enabled = 1
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
