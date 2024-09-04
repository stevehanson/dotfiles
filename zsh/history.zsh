setopt hist_ignore_all_dups inc_append_history

# prepend command with a space, and it won't be written to history
setopt histignorespace

HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export ERL_AFLAGS="-kernel shell_history enabled"
