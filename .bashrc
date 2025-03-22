# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Ghostty shell integration for Bash. This should be at the top of your bashrc!
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
  builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  #alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  #alias grep='grep --color=auto'
  #alias fgrep='fgrep --color=auto'
  #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# colorize output
GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh

#Brightness control from keybaord
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-up "['<Ctrl><Super>Up']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-down "['<Ctrl><Super>Down']"

#path
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin/:/home/h4ck3r/.cargo/bin:home/h4ck3r/go/bin:/home/h4ck3r/.local/bin:/usr/bin:/usr/games:/usr/local/bin

# preferred text editor
#EDITOR=nano

#homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#ble.sh
source ~/.local/share/blesh/ble.sh

#most - colorful output for man
#export PAGER=most

#highlight less
# export LESSOPEN="| /usr/bin/highlight %s --out-format xterm256 --force"

# greet me
echo "w3lc0m3 h4ck3r - let the games begin! - m4ast3r y0ur cr4ft" | lolcat

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

# Atuin
eval "$(atuin init bash)"

#starship prompt - shell prompt
eval "$(starship init bash)"

# zoxide
eval "$(zoxide init bash)"

# rust/cargo
. "$HOME/.cargo/env"
