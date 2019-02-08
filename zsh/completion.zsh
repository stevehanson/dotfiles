# load our own completion functions
fpath=(\
  ~/.zsh/completion \
  /usr/local/share/zsh-completions \
  /usr/local/share/zsh/site-functions \
  ~/dev/arcanist/arcanist/resources/shell/bash-completion
  $fpath\
)

# completion
autoload -U compinit
compinit
