# Applications

Most applications are installed via Brew casks in the [laptop
script](../laptop) ([see Brewfile](../brewfile)). Manually install the following applications that are not
available as casks.

## Download apps from the App Store

Log into the Mac App Store and re-download the following by clicking on my profile:

* Magnet -- position windows
* Things 3 -- task manager
* XCode -- iOS development
* Pixelmator Pro -- image editing

I might choose to automate installation of the above with [Mas](https://github.com/mas-cli/mas) at a later time, or maybe brew casks will be added. For now, I don't mind keeping this manual since I like being able to install these as the Homebrew packages are also being downloaded.

## Download apps from the web

* [Sip](https://sipapp.io/) -- color picker
  * license is in my gmail (search for "sip paddle"), might need to download older version since license gives one year of updates. Using v2.7.1 as of 2024

## App configuration

### Configure Magnet

Set the following keyboard mappings in Preferences:

* Left: cmd+opt+H
* Right: cmd+opt+L
* Up: cmd+opt+K
* Down: cmd+opt+J
* Maximize: cmd+opt+F
* Restore: cmd+opt+R

### Configure Karabiner Elements

We will import and enable two rules:

* Go to Complex Modifications -> Add Rule -> Import from Internet
* Import “Change caps_lock key (rev 5)
* Enable rule: “Change caps_lock to control if pressed with other keys, to escape if pressed alone.”
* Import rule from Internet "Keyboard Brightness Adjustment"
* Enable rule: "command-f1 and f2 to adjust keyboard brightness

### Configure Apptivate

Set up shortcuts for Chrome (cmd+space), Mail (“ctrl+a, M”), iTerm (“ctrl+a, T”), Slack (“ctrl+a, S”), Finder, 1Password, Spotify ("P"), VS Code, Notion, Messages ("E"), Notion Calendar, Zoom. All shortcuts are chorded starting with “ctrl+a” except Chrome

### Configure Chrome

Set up two profiles called Work and Personal. Add keyboard shortcuts ctrl+s ("Stephen (Personal)") and ctrl+w ("Stephen (Work)") for launching the profiles in System Preferences -> Keyboard -> Keyboard Shortcuts

### Configure Alfred

* Install "[Search Notes](https://github.com/sballin/alfred-search-notes-app)" plugin by Sean Ballinger
* Install "[IP Address](https://alfred.app/workflows/alexchantastic/ip-address/)"
* Install "[Calm Notifications](https://alfred.app/workflows/vitor/calm-notifications/)" (adds "do not disturb" time-boxed commands, eg. "dnd 30" for 30 minute focus)
* Configure clipboard history with hotkey cmd+ctrl+c, set it to also keep images 

### Configure 1Password

Just sign in. I subscribe to the family plan.

### Configure VS Code

Settings should be synced automatically, but also see my [VSCode instructions](./vscode).
