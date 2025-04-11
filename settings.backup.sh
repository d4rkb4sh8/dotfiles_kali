#!/usr/bin/env bash

#gnome settings
#dconf dump / >$HOME/dotfiles_kali/backups/gnome_settings.bak

# XFCE settings
cp -Trv $HOME/.config/xfce4 $HOME/dotfiles_kali/backups/xfce4/

#apt_list
apt list --installed | cut -d "/" -f1 | grep -v "Listing..." >$HOME/dotfiles_kali/backups/apt_list.bak

#flatpaks_list
flatpak list --app --columns=application >$HOME/dotfiles_kali/backups/flatpaks_list.bak

# brew list
brew list -1 >$HOME/dotfiles_kali/backups/brew_list.bak

#snap list
#snap list | awk 'NR>1{print $1}' >$HOME/dotfiles_kali/backups/snap_list.bak
