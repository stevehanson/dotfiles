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

# Private, client-specific config
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private
