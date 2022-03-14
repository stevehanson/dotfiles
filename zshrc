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
export SDKMAN_DIR="/Users/shanson/.sdkman"
[[ -s "/Users/shanson/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/shanson/.sdkman/bin/sdkman-init.sh"

# init NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by laptop script
export PATH="$HOME/.bin:$PATH"
