# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:$HOME/.bin.private:/usr/local/sbin:$PATH"

# load ASDF version manager
if [ -d "$HOME/.asdf" ]; then
  . $HOME/.asdf/asdf.sh
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# add custom scripts to path
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export -U PATH
