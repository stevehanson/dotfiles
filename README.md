# shanson's dotfiles

These dotfiles set up Zsh, Vim, and tmux, and are also used to back up iTerm
config and manage other program dotfiles, like `rbenv` and `git`. Some of this
configuration is borrowed from [thoughtbot's dotfiles][thoughtfiles].
thoughtbot's [rcm][rcm] is used to manage creating symlinks to the home
directory.

![Terminal Screenshot](iterm/screenshot.png)

## Setting up a new computer

### Clone this repo

Clone this repo to `~/dotfiles`.

### Run laptop script

When setting up a new computer, the [laptop](laptop) script that is included in
this repo should be used. This script is a modified version of [thoughtbot's
Laptop script](https://github.com/thoughtbot/laptop). Run the Laptop script
with:

```
> ~/dotfiles/laptop
```

This script is idempotent, so it can be modified and run again as needed. After
the laptop script finishes, continue setting up the dotfiles, according to the
instructions. Some changes from the script, like [the Mac key repeat
changes](laptop#L175), may require a restart before they take effect.

## Install dotfiles

Set zsh as your login shell:

```bash
chsh -s $(which zsh)
```

Then, clone or fork this repo into `~/dotfiles` if not already done in the
Laptop setup.

Install [rcm][rcm] (not required if laptop script was done):

```bash
brew tap thoughtbot/formulae
brew install rcm
```

Install the dotfiles:

```bash
env RCRC=$HOME/dotfiles/rcrc rcup
```

Any files in this repo that are not prefixed with a `.` are automatically symlinked
to the home directory with a `.` prefix when `rcup` is run. After this initial 
`rcup`, the `RCRC` ENV variable does not need to be manually specified.

To exclude any files or directories from being symlinked, modify the [rcrc](rcrc) file.

Running `rcup` does the following:

* Symlinks files to the home directory
* Runs vim-plug and zplug (specified in [hooks/post-up]())

If new files are added, the `post-up` can be skipped by running `rcup -K`.

For more information on what happens with `rcup`, see the [thoughtbot dotfiles
repo][thoughtfiles].

## Other manual steps

When setting up a new computer, the following manual steps should also be taken.

### Install apps

[Install and configure applications](./docs/applications.md)

### Backing up old computer

* Manually back up the Photos and Photo Booth libraries for copy to new machine
* Export Alfred preferences
* Export Day One Journal
* Back up `dev` directory

### Configure SSH keys

* Generate new SSH key, upload to GitHub, update ~/.ssh/config file with new key
* Copy relevant config from `~/.ssh/config` of old machine to new machine (eg.
  SSH names)

[thoughtfiles]: https://github.com/thoughtbot/dotfiles
[rcm]: https://github.com/thoughtbot/rcm
