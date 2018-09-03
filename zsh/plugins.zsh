source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggest -- select suggestion with Ctrl+N
bindkey '' autosuggest-execute

# fzf -- use Ctrl+T to open auto-complete list
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPS='--bind up:preview-up,down:preview-down'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"