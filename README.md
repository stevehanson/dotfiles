# shanson's dotfiles

These dotfiles set up Zsh, Vim, and tmux, and are also used to back up iTerm
config and manage other program dotfiles, like `asdf` and `git`. Some of this
configuration is borrowed from [thoughtbot's dotfiles][thoughtfiles].
thoughtbot's [rcm][rcm] is used to manage creating symlinks to the home
directory.

![Terminal Screenshot](iterm/screenshot.png)

## Setting up a new computer

### Install apps

[Install and configure applications](./docs/applications.md)

### Run laptop script

When setting up a new computer, the [thoughtbot
Laptop](https://github.com/thoughtbot/laptop) script should be used. This repo
includes a slightly modified version of the laptop script, and includes further
customization in `laptop.local`. Clone this repo down to `~/dotfiles` and then
run the Laptop script with:

```
> ~/dotfiles/laptop
```

After the laptop script finishes, continue setting up the dotfiles, according to the instructions.

## Dotfiles Installation

Set zsh as your login shell:

```bash
chsh -s $(which zsh)
```

Then, clone or fork this repo into `~/dotfiles` if not already done in the Laptop setup.

Install [rcm][rcm] (not required if laptop script was done):

```bash
brew tap thoughtbot/formulae
brew install rcm
```

Install the dotfiles:

```bash
env RCRC=$HOME/dotfiles/rcrc rcup
```

Any files in this repo that are not prefixed with a `.` are automatically copied
to the home directory when `rcup` is run. After this initial `rcup`, the `RCRC`
ENV variable does not need to be manually specified.

For more information on what happens with `rcup`, see the [thoughtbot dotfiles
repo][thoughtfiles].

### Other manual steps

* Generate new SSH key, upload to GitHub, update ~/.ssh/config file with new key
* Copy relevant config from `~/.ssh/config` of old machine to new machine (eg.
  SSH names)

[thoughtfiles]: https://github.com/thoughtbot/dotfiles
[rcm]: https://github.com/thoughtbot/rcm
