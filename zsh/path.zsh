export HOMEBREW_ROOT="/opt/homebrew"
export ANDROID_HOME=~/Library/Android/sdk
export BAT_CONFIG_PATH=~/.bat.conf
export RBENV_ROOT="${HOME}/.rbenv"

eval "$($HOMEBREW_ROOT/bin/brew shellenv)"

# add scripts from dotfiles/bin to path
export PATH="$HOME/.bin.private:$PATH"

# add homebrew directory to path
PATH="$HOMEBREW_ROOT/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Add python/pip packages
PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Add yarn
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add Android tools
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/bin:$ANDROID_HOME/platform-tools

# add custom scripts to path
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export -U PATH
