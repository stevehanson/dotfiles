# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOMEBREW_ROOT/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOMEBREW_ROOT/opt/fzf/shell/key-bindings.zsh"
