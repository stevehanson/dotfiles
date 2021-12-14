# Configure VS Code

Sign in with GitHub to load synced settings.

Install extensions from the `extensions.txt` file with:

> cat ~/dotfiles/config/vscode/extensions.txt | xargs -n 1 code --install-extension

Update this file when new extensions are added with:

> > code --list-extensions >> ~/dotfiles/config/vscode/extensions.txt
