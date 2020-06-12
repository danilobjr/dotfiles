#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Xresources
[[ -f "$HOME/.Xresources" ]] && xrdb $HOME/.Xresources

# keyboard map
[[ -f "$HOME/.Xmodmap" ]] && xmodmap $HOME/.Xmodmap
xmodmap -e 'clear lock'

# bitmap font
xset fp+ $HOME/.local/share/fonts/bitmap
xset fp rehash

# wallpaper
if [ -f $HOME/.fehbg ]
then
  source $HOME/.fehbg;
else
  background $dotfiles/wallpapers/wall.jpg;
fi

exec i3
