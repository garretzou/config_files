#!/bin/bash
sudo killall fcitx
dconf write "/org/gnome/desktop/input-sources/xkb-options" "['caps:swapescape']"
