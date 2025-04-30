#!/usr/bin/env bash

#gnome settings
dconf dump / >$HOME/dotfiles/backups/gnome_settings.bak

#apt_list
dpkg-query -f '${Package}\n' -W >$HOME/dotfiles/backups/apt_list.bak

#flatpaks_list
flatpak list --app --columns=application >$HOME/dotfiles/backups/flatpaks_list.bak

# brew list
brew list -1 >$HOME/dotfiles/backups/brew_list.bak

#snap list
snap list | awk 'NR>1{print $1}' >$HOME/dotfiles/backups/snap_list.bak
