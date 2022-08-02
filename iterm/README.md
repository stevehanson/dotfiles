# iTerm Config

![Terminal Screenshot](screenshot.png)

The [com.googlecode.iterm2.plist](com.googlecode.iterm2.plist) file can be
imported into iTerm to restore settings.

This directory also contains some other files:

### Terminfo files

These files set up iTerm to display 256 colors and italics font-styles. They are
automatically loaded in the laptop script (see [laptop.local](../laptop))
on initial computer setup and then used in the zsh and tmux config.

### theme

If iTerm config is imported, it probably isn't necessary to use this directly.

Using the Whimsy iTerm theme, with the following changes:

* Foreground color: ccccd6 (lighter for more contrast)
* Background color: 292838 (less blue, from 29283b)

Using One Dark in Vim with background set to match terminal. Tree-sitter is used
for better syntax highlighting. Still need to customize Airline and tmuxline to
match. Would be easier if I could just use a package that sets all of them at
once (like the vim-dracula package does).
