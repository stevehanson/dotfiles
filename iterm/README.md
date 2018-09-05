# iTerm Config

![Terminal Screenshot](screenshot.png)

The [com.googlecode.iterm2.plist](com.googlecode.iterm2.plist) file can be
imported into iTerm to restore settings.

This directory also contains some other files:

### Terminfo files

These files set up iTerm to display 256 colors and italics font-styles. They are
automatically loaded in the laptop script (see [laptop.local](../laptop.local))
on initial computer setup and then used in the zsh and tmux config.

### One Dark theme

If iTerm config is imported, it probably isn't necessary to use this directly.
