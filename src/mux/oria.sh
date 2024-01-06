#!/usr/bin/env bash

main() {
  local wd=$HOME/dev/oria
  local s=oria
  cd $wd
  
  tmux new-session -d -s $s -n "main"
  tmux send-keys -t $s:1 "vi ." C-m
  #---------------------------------------------------------------------------
  tmux new-window -t $s:2 -n "server"
  tmux send-keys -t $s:2 "oria-serve" C-m
  tmux split-window -t $s:2 -h
  tmux send-keys -t $s:2 "tail -f log/development.log" C-m
  #---------------------------------------------------------------------------
  tmux new-window -t $s:3 -n "console"
  tmux send-keys -t $s:3 "rails c" C-m
  #---------------------------------------------------------------------------
  tmux new-window -t $s:4 -n "redis"
  tmux send-keys -t $s:4 "redis-server" C-m
  #---------------------------------------------------------------------------
  tmux new-window -t $s:5 -n "mailcatcher"
  tmux send-keys -t $s:5 "mailcatcher" C-m
  #---------------------------------------------------------------------------
  tmux select-window -t $s:1
  #tmux attach -t $s:1 
}

main
