# load ASDF version manager -- prepends to front of path
if [ -d "$HOME/.asdf" ]; then
  . $HOME/.asdf/asdf.sh
fi

export ANDROID_HOME=~/Library/Android/sdk
export BAT_CONFIG_PATH=~/.bat.conf

# ensure dotfiles bin directory is loaded first, before asdf
PATH="$HOME/.bin:$HOME/.bin.private:/usr/local/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Add python/pip packages
PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Add yarn
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add Android tools
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# add custom scripts to path
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
PATH="$PATH:$HOME/dev/arcanist/arcanist/bin"

export -U PATH
