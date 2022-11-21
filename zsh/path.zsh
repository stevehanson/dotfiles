export HOMEBREW_ROOT="/opt/homebrew"
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export BAT_CONFIG_PATH=~/.bat.conf
export RBENV_ROOT="${HOME}/.rbenv"

eval "$($HOMEBREW_ROOT/bin/brew shellenv)"

# add scripts from dotfiles/bin to path
export PATH="$HOME/.bin.private:$PATH"

# add homebrew directory to path
PATH="$HOMEBREW_ROOT/sbin:$PATH"

# Add python/pip packages
PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Add yarn
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add Android tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# add custom scripts to path
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH
