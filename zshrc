# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

source ~/.zsh/color.zsh
source ~/.zsh/editor.zsh
source ~/.zsh/history.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/options.zsh
source ~/.zsh/path.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh

# Private, client-specific config, aliases, etc.
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private

# Source Java SDK Manager
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# added by laptop script
export PATH="$HOME/.bin:$PATH"

eval "$(nodenv init -)"

eval "$(direnv hook zsh)"

# bun completions
[ -s "/Users/shanson/.bun/_bun" ] && source "/Users/shanson/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/shanson/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
