#!/usr/bin/env bash
xdotool search --class "kitty-popup" | xargs -r -n1 wmctrl -ic
