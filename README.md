# dotfiles

My dotfiles.

It installs the [i3wm](https://github.com/i3/i3) ([gaps version](https://github.com/Airblader/i3)) for a more lightweight and focused windows management, some dev stuff and utilities. Take a look at [Resources](#resources) section to see the whole list.

It was tested in a fresh installation of Arch Linux on May 2020.

## Install

Run this in your terminal.

```
bash <(wget -qO- https://raw.githubusercontent.com/danilobjr/dotfiles/master/install.sh)
```

After installation you should reboot your system for all settings take effect.

## Troubleshooting

If something goes wrong, take a look at installation log file _.dotfiles.log_ in your home directory.

You can search for a related issue at [issues tab](https://github.com/danilobjr/dotfiles/issues) as well. If there isn't, [create one](https://github.com/danilobjr/dotfiles/issues/new).

## Resources

### Desktop Environment

- [Xorg](https://www.x.org/) - An open source implementation of the X Window System.
- [i3-gaps](https://github.com/Airblader/i3) - Windows Management.
- [Polybar](https://github.com/jaagr/polybar) - A fast and easy-to-use status bar.
- [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen) - Sweet looking lockscreen for linux system - i3lock.
- [feh](https://feh.finalrewind.org) - An X11 image viewer aimed mostly at console users.
- [neofetch](https://github.com/dylanaraps/neofetch) - A command-line system information tool written in bash 3.2+.
- [htop](https://htop.dev/) - An interactive process viewer.
- [rofi](https://github.com/DaveDavenport/rofi) - A window switcher, application launcher and dmenu replacement.
- [ranger](https://github.com/ranger/ranger) - A VIM-inspired filemanager for the console.
- [Chromium](https://www.chromium.org/Home) - Open-source browser.
- [scrot](http://freshmeat.sourceforge.net/projects/scrot) - A simple commandline screen capture utility.
- [compton](https://wiki.archlinux.org/index.php/Compton) - It's a standalone compositor for Xorg.

### Dev Stuff

- [Rxvt-unicode](https://wiki.archlinux.org/index.php/Rxvt-unicode) - Terminal emulator.
- [zsh](http://zsh.sourceforge.net/) - Shell designed for interactive use.
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - An open source, community-driven framework for managing your zsh configuration.
- [z](https://github.com/rupa/z/) - Jump around in your directories (command line tool).
- [git](https://git-scm.com/) - A free and open source distributed version control system.
- [nvm](https://github.com/creationix/nvm) - Node Version Manager.
- [Node.js](https://nodejs.org/) - It is a JavaScript runtime built on Chrome's V8 JavaScript engine.
- [vercel](https://vercel.com/) - Optimal workflow for frontend teams. All-in-one: Static and Jamstack deployment, Serverless Functions, and Global CDN.
- [Visual Studio Code](https://code.visualstudio.com/) - Code editing. Redefined. Free. Open source. Runs everywhere.
- [neovim](https://www.neovim.io/) - Hyperextensible Vim-based text editor.

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
- `Win+j, k, l or ;` - Change focused to adjacent window.
- `Win+Arrow keys` - Change focused to adjacent window.
- `Win+Shift+j, k, l or ;` - Move focused window.
- `Win+Shift+Arrow keys` - Move focused window.
- `Win+r` - Enter resize mode.
  - `h, j, k or l` - Change size when resize mode is on.
  - `Arrow keys` - Change size when resize mode is on.

#### i3 - System

- `Win+Space` - Show app search bar (fuzzy finder). Chromium and Chrome open always in Workspace 1.
- `Win+F4` - Show system off options that user can choose from: Logout, Reboot, Hibernate and Shutdown.
- `Win+Esc` - Lock screen. Enter password to return.
- `Fn+Increase Volume (function key)` - Increase master volume.
- `Fn+Decrease Volume (function key)` - Decrease master volume.
- `Fn+Mute Volume (function key)` - Mute master volume.
- `PrintScreen` - Take a screenshot of entire display.
- `Shift+PrintScreen` - Take a screenshot of a focused window.

#### i3 - Programs

- `Win+e` - Open ranger in a new window (file manager).

#### i3 - Workspaces

- `Win+(Number)` - Go to that number workspace.
- `Win+Shift+(Number)` - Send focused window to that workspace.
- `Win+PgUp` - Go to previous workspace.
- `Win+PgDown` - Go to next workspace.

#### i3 - Customization

You can customize i3 in the [config](i3/config) file. After changes, just hit `Win+F5` to reload it.

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
- `m` - /media
- `h` - ~
- `c` - ~/.config
- `i` - ~/.dotfiles/i3
- `R` - ~/.dotfiles/ranger
- `p` - ~/.dotfiles/polybar
- `w` - ~/.dotfiles/wallpapers
- `x` - ~/.dotfiles/xorg
- `.` - ~/.dotfiles
- `r` - ~/repos
- `d` - ~/Downloads
- `P` - ~/Pictures
- `v` - ~/Videos

Examples:

- `gd` - Go to _~/Downloads_ folder.
- `mv` - Move selected file/folder to _~/Videos_ folder.
- `tr` - Create a new tab at _~/repos folder.

#### Ranger - General file manipulation

- `mkd` - Create a new directory (it'll ask for you name it).
- `D` - Delete selected files/folders (it'll prompt you).

#### Ranger - Code editors

There's a common pattern for Vim and Visual Studio Code.

Visual Studio Code.

- `ecc` - Open selected file in Code.
- `ecn` - Prompt shell command line to type a new file and open it in Code.
- `ecd` - Open current directory in Code.

Vim.

- `evv` - Open selected file in Vim.
- `evn` - Prompt shell command line to type a new file and open it in Vim.
- `evd` - Open current directory in Vim.

#### Ranger - Zip and Unzip

- `ZZ` - Zip selected objects to the current folder named as _container.zip_.
- `XX` - Prompt a unzip command with current file name (it has [Smart shortcuts](#ranger---smart-shortcuts) to extract at specific directories).

#### Ranger - System

- `bg` - Set the selected image as wallpaper.

### Zsh

There is bunch of aliases for npm, yarn, git, pacman and configuration files. You can modify them at `~/.zshrc`. See the whole aliases list [here](zsh/.zshrc).

A `~/repos` folder is created in your home directory when Zsh runs at first time. It is the default folder on Zsh startup. I put all my repos there.

### Visual Studio Code

It comes with Vim extension preinstalled by default and some other extensions as well. You can check them by pressing _Ctrl+Shift+X_ inside VSCode.

There are some **keybindings** that you can check at _File > Preferences > Keyboard Shortcuts_
and then search for _@source:user_ in the _Search keybindings_ field.

Some **snippets** are defined as well for Javascript and Typescript, including React versions.
You can see them at _File > Preferences > User Snippets_.
They are on top of the list.

_**Note:** You can press Alt to toggle menu._

### NeoVim

It comes with some preinstalled plugins, such as coc.nvim, lightline, vim-fugitive, auto-pairs, etc.
You can check at `~/.config/nvim/init.vim` file.

### Wallpapers

To set a wallpaper manually just name a image file as `wall.jpg` in move it to [`wallpapers`](wallpapers) folder and then reload i3 by pressing `Win+F5`.

Or you can just run ranger, put cursor over an image, and press `bg`.

## TODO

- Automatic mounting for USB/Dvd.
- Video recording (gif/mp4).
- Send email from ranger?
- Update docs: background script, etc.
OK - Instal use rofi instead of dmenu.
- FAQ setcion: log, audio, print, etc.

## License

Licensed under [MIT License](https://danilobjr.mit-license.org/).
