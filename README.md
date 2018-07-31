# dotfiles

My dotfiles.

It installs the [i3wm](https://github.com/i3/i3) for a more lightweight and focused windows management, some dev stuff and utilities. Take a look at [Resources](#resources) section to see the whole list.

It was tested in a fresh installation (not minimal) of Ubuntu 18.04.

<p align="center"><img src="/demo/demo.gif"></p>

## Install

Run this in your terminal.

```
bash <(wget -qO- https://raw.githubusercontent.com/danilobjr/dotfiles/master/install.sh)
```

After installation you should reboot your system for all settings take effect.

## Resources

### Desktop Environment

- [i3wm](https://github.com/i3/i3) - Windows Management.
- [i3blocks](https://github.com/vivien/i3blocks) - Status line for the i3.
- [ranger](https://github.com/ranger/ranger) - A VIM-inspired filemanager for the console.
- [Chromium](https://www.chromium.org/Home) - Open-source browser.

### Dev Stuff

- [zsh](http://zsh.sourceforge.net/) - Shell designed for interactive use.
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - An open source, community-driven framework for managing your zsh configuration.
- [z](https://github.com/rupa/z/) - Jump around in your directories (command line tool).
- [git](https://git-scm.com/) - A free and open source distributed version control system.
- [nvm](https://github.com/creationix/nvm) - Node Version Manager.
- [Node.js](https://nodejs.org/) - It is a JavaScript runtime built on Chrome's V8 JavaScript engine.
- [Visual Studio Code](https://code.visualstudio.com/) - Code editing. Redefined. Free. Open source. Runs everywhere.
- [Vim](https://www.vim.org/) - A highly configurable text editor for efficiently creating and changing any kind of text.

### Utilities

- [Brightness Controller](https://github.com/lordamit/Brightness)
- [feh](https://feh.finalrewind.org/) - An X11 image viewer aimed mostly at console users.
- [compton](https://wiki.archlinux.org/index.php/Compton) - It's a standalone compositor for Xorg.

### What's next

Enable color scheme for Vim by uncomment the lines below.

```
let base16colorspace=256
colorscheme base16-default-dark " the base16-shell colors has precedence
```

## Usage

### Window

- `Win+Enter` - Open a terminal in a new window.
- `Win+q` - Close focused window.
- `Win+f` - Toggle fullscreen.
- `Win+Shift+f` - Toggle floating/tiling mode.
- `Win+p` - Focus parent window.
- `Win+c` - Focus child window.
- `Win+-` - Prepare to open window horizontally.
- `Win+\` - Prepare to open window vertically.
- `Win+h, j, k or l` - Change focused to adjacent window.
- `Win+Arrow keys` - Change focused to adjacent window.
- `Win+Shift+h, j, k or l` - Move focused window.
- `Win+Shift+Arrow keys` - Move focused window.
- `Win+r` - Enter resize mode.
  - `h, j, k or l` - Change size when resize mode is on.
  - `Arrow keys` - Change size when resize mode is on.

### System

- `Win+Space` - Show app search bar (fuzzy finder). Chromium and Chrome open always in Workspace 1. VSCode opens in WS2.
- `Win+F4` - Show system off options that user can choose from: Logout, Reboot, Hibernate and Shutdown.
- `Win+ESC` - Lock screen using [i3lock](https://github.com/i3/i3lock). Enter password to return.
- `Win+Mute` - Mute master volume.
- `Win+LowVolume` - Lower master volume.
- `Win+HighVolume` - Higher master volume.

### Programs

- `Win+e` - Open ranger in a new window (file manager).

### Workspaces

- `Win+(Number)` - Go to that number workspace.
- `Win+Shift+(Number)` - Send focused window to that workspace.
- `Win+PgUp` - Go to previous workspace.
- `Win+PgDown` - Go to next workspace.

### Zsh

There is bunch of aliases for npm, yarn, git, git-flow and configuration files. You can modify them at `~/.zshrc`. See the whole [aliases list here](zsh/README.md).

A `~/dev/` folder is created in your home directory when Zsh runs at first time. It is the default folder on Zsh startup. I put all my repos there.

### Visual Studio Code

It comes with Vim extension preinstalled by default and some other extensions as well. You can check them by pressing _Ctrl+Shift+X_ inside VSCode.

There are some **keybindings** that you can check at _File > Preferences > Keyboard Shortcuts_
and then search for _@source:user_ in the _Search keybindings_ field.

Some **snippets** are defined as well for Javascript and Typescript, including React versions.
You can see them at _File > Preferences > User Snippets_.
They are on top of the list.

### Vim

It comes with a bunch of preinstalled plugins, such as NerdTree, vim-suround, vim-airline etc.
You can check at `~/.vimrc` file.

### Wallpapers

To set a wallpaper just name a image file as `wall.jpg` in move it to `~/.dotfiles/wallpapers/` folder and then reload i3 `Win+Shift+r`.

## TODO

- Set wallpaper by other means. For example: ranger keybinding.
- Put a desktop screenshot and first zsh access message.
- Install node and npm packages during install: now, terminal-alarm. Then document them here.
- Use st terminal emulator instead of gnome-terminal.
- Remove unused software during installation such as: firefox, nautilus, ubuntu settings, etc.

## License

Licensed under [MIT License](https://danilobjr.mit-license.org/).
