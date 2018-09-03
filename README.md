# shanson's Dotfiles

These dotfiles are based off of [thoughtbot's
dotfiles][thoughtfiles]. I previously used the thoughtbot
dotfiles along with [my own overrides](https://github.com/stevehanson/dotfiles-local) but decided to merge mine in with theirs in order
to have more control over my dotfiles.

## Setting up a new computer

When setting up a new computer, the [thoughtbot
Laptop](https://github.com/thoughtbot/laptop) script should be used. The
`laptop.local` script customization is managed in this repo. Clone this
repo down and manually copy `laptop.local` to `~/.laptop.local` (`ln -s
    ~/dotfiles/laptop.local ~/.laptop.local`) and then run the
Laptop script. 

After the laptop script finishes, continue setting up the dotfiles, according to the instructions.

## Installation

Set zsh as your login shell:

```bash
chsh -s $(which zsh)
```

Then, clone or fork this repo into `~/dotfiles`.

Install [rcm](https://github.com/thoughtbot/rcm):

```bash
brew tap thoughtbot/formulae
brew install rcm
```

Install the dotfiles:

```bash
env RCRC=$HOME/dotfiles/rcrc rcup
```

Any files in this repo that are not prefixed with a `.` are automatically copied
to the home directory when `rcup` is run.

For more information on what happens with `rcup`, see the [thoughtbot dotfiles
repo][thoughtfiles].

[thoughtfiles]: https://github.com/thoughtbot/dotfiles
