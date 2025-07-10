#!/usr/bin/env bash

WINDOW=$(xdotool search --class "kitty-popup" | head -n 1)

if [ -z "$WINDOW" ]; then
    # Not running — launch it
    ~/bin/kitty_popup.sh
else
    # Check if minimized
    STATE=$(xprop -id "$WINDOW" _NET_WM_STATE)
    if [[ "$STATE" == *"_NET_WM_STATE_HIDDEN"* ]]; then
        # Restore window
        wmctrl -x -r "kitty-popup" -b remove,hidden
        wmctrl -x -a "kitty-popup"
    else
        # Minimize window
        wmctrl -x -r "kitty-popup" -b add,hidden
    fi
fi
