augroup shanson
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint,babel}rc set filetype=json
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
  autocmd BufRead,BufNewFile gitconfig set filetype=gitconfig
  autocmd BufRead,BufNewFile aliases,*/zsh/configs/*,*/zsh/functions/*,*bin/* set filetype=sh

  " Auto-reload on buffer focus or enter
  au FocusGained,BufEnter * :silent! !
augroup END
