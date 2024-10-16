source $HOMEBREW_ROOT/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_ROOT/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# zsh-syntax-highlighting
typeset -A ZSH_HIGHLIGHT_PATTERNS
typeset -A ZSH_HIGHLIGHT_REGEXP
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern regexp)
ZSH_HIGHLIGHT_REGEXP+=('(gc|git commit|gamend|gam) -a?m \"[^"]{52,}' 'fg=red,bold')

# zsh-autosuggest -- select suggestion with Ctrl+N
bindkey '' autosuggest-execute

# fzf -- use Ctrl+T to open auto-complete list
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPS='--bind up:preview-up,down:preview-down'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Open branch fuzzy finder with ^G^B
_fuzzy_git_branches() {
  zle -U "$(
    git branch --color=always --sort=-committerdate | \
    grep -v '^* ' | \
    grep -v '^\s\+master' | \
    fzf-tmux --reverse --ansi --select-1 | \
    sed -E 's/^[ \t]*//'
  )"
}

zle -N fuzzy-git-branches _fuzzy_git_branches
bindkey '^G^B' fuzzy-git-branches
