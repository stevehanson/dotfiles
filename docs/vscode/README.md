# Configure VS Code

## Load synced settings from the cloud

Sign in with GitHub to load synced settings. This only synces the main settings file but not extensions, keybindings, snippets, etc.

## Install extensions

Install extensions from the `extensions.txt` file with:

```
> cat ~/dotfiles/config/vscode/extensions.txt | xargs -n 1 code --install-extension
```

Update this file when new extensions are added with:

```
> code --list-extensions >> ~/dotfiles/config/vscode/extensions.txt
```

## Load keybindings

Copy [[keybindings.json]] into the keybindings file in VS Code. Periodically back this file up.

## Load snippets

TBD. There is the VS Code Settings Sync extension, but I might try to find something lighter weight.
