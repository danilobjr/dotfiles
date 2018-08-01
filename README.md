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

- [Rxvt-unicode](https://wiki.archlinux.org/index.php/Rxvt-unicode) - Terminal emulator.
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

### i3

[i3wm](https://github.com/i3/i3) uses a bunch of shortcuts to manage things.
Here are the main ones separated by category.

#### i3 - Window Management

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

#### i3 - System

- `Win+Space` - Show app search bar (fuzzy finder). Chromium and Chrome open always in Workspace 1. VSCode opens in WS2.
- `Win+F4` - Show system off options that user can choose from: Logout, Reboot, Hibernate and Shutdown.
- `Win+ESC` - Lock screen using [i3lock](https://github.com/i3/i3lock). Enter password to return.
- `Win+Increase Volume (function key)` - Increase master volume.
- `Win+Decrease Volume (function key)` - Decrease master volume.
- `Win+Mute Volume (function key)` - Mute master volume.

#### i3 - Programs

- `Win+e` - Open ranger in a new window (file manager).

#### i3 - Workspaces

- `Win+(Number)` - Go to that number workspace.
- `Win+Shift+(Number)` - Send focused window to that workspace.
- `Win+PgUp` - Go to previous workspace.
- `Win+PgDown` - Go to next workspace.

### Ranger

By using this awesome piece of technology with default settings you already are kicking-ass productive. I just added some more keymaps accordinglly to my preferences.

If you're not familiar with it, you can see this [cheatsheet](https://ranger.github.io/cheatsheet.png) for a basic comprehension.
I put some very basic shortcuts bellow as well.

Some considerations:

- As mentioned before, you can open ranger with `Win+e`.
- _Hidden files_ is shown by default.
- I removed all keymaps for _bookmarks_. I added some smart ones for a fast access to some folders.
- I removed `q` and `ZZ` for quit. Only `Q` remains. Or simply use `Win+q` from i3.

And you can change all these in [rc.conf](ranger/rc.vonf) file.

#### Ranger - Basics

These are the basic keymaps. Note that they are mostly vim-based.

- `h, j, k or l` - Move left, down, up or right (where left moves up in the directory structure, right moves into a folder or open if is a file).
- `Space` - Select file.
- `dd` - Cut selected files.
- `yy` - Copy selected files.
- `pp` - Paste/move copied/cut files.
- `/` - Search. Then use `n`/`N` for next/previous result.
Renaming files:
- `cw` - Rename file from scratch.
- `A` - Rename file appending cursor to the end.
- `a` - Rename file putting cursor before the extension.
- `I` - Rename file putting cursor at the beginning.

#### Ranger - Smart shortcuts

I've added many folder-specific shortcuts for fast move. Here's the idea:

```
<Action><Location>
```

`<Action>`:

- `g` - Go to.
- `Y` - Copy to.
- `m` - Move to.
- `t` - Create new tab at.
- `X` - Unzip at.

`<Location>`:

- `/` - / (except for `X` action)
- `h` - ~
- `c` - ~/.config
- `?` - ~/.config/ranger
- `.` - ~/.dotfiles
- `d` - ~/dev
- `l` - ~/Downloads
- `p` - ~/Pictures
- `v` - ~/Videos

Examples:

- `gl` - Go to _~/Downloads_ folder.
- `mv` - Move selected file/folder to _~/Videos_ folder.
- `td` - Create a new tab at _~/dev_ folder.

#### Ranger - General file manipulation

- `mkd` - Create a new directory (it'll ask for you name it).
- `D` - Delete selected files/folders (it'll prompt you).

#### Ranger - Code editors

- `C` - Prompt the selected file/folder to open with Visual Studio Code.
- `V` - Prompt for a new file to open with Vim.

#### Ranger - Zip and Unzip

- `ZZ` - Zip selected objects to the current folder named as _container.zip_.
- `XX` - Prompt a unzip command with current file name (it has [Smart shortcuts](#ranger---smart-shortcuts)).

#### Ranger - System

- `bg` - Set the selected image as wallpaper.

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

- Put a desktop screenshot and first zsh access message.
- Install node and npm packages during install: now, terminal-alarm. Then document them here.
- Use st terminal emulator instead of gnome-terminal.
- Remove unused software during installation such as: firefox, nautilus, ubuntu settings, etc.

## License

Licensed under [MIT License](https://danilobjr.mit-license.org/).
