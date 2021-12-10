# load our own completion functions
fpath=(\
  ~/.zsh/completion \
  $HOMEBREW_ROOT/share/zsh-completions \
  $HOMEBREW_ROOT/share/zsh/site-functions \
  $fpath\
)

# completion
autoload -U compinit
compinit
