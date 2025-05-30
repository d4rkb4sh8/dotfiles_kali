#!/bin/bash
SESSION="main"

if ! tmux has-session -t $SESSION 2>/dev/null; then
  tmux new-session -d -s $SESSION
fi

kitty tmux attach -t $SESSION
