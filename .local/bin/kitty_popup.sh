#!/usr/bin/env bash

# Size and position: width x height + x_offset + y_offset
WIDTH=800
HEIGHT=600

# Center on screen
SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d 'x' -f1)
SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d 'x' -f2)

X_OFFSET=$(( (SCREEN_WIDTH - WIDTH) / 2 ))
Y_OFFSET=$(( (SCREEN_HEIGHT - HEIGHT) / 2 ))

# Unique window class or title to target it
KITTY_CLASS="kitty-popup"

# Launch it
kitty --class "$KITTY_CLASS" --config "$HOME/.config/kitty/popup.conf" \
  --start-as=normal --override "initial_window_width=${WIDTH}px initial_window_height=${HEIGHT}px" \
  &

# Give it time to start
sleep 0.3

# Move it to center
wmctrl -x -r "$KITTY_CLASS" -e "0,$X_OFFSET,$Y_OFFSET,$WIDTH,$HEIGHT"
