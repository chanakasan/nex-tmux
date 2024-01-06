#!/usr/bin/env bash

. ~/nex-bash/lib/lib-tmux.sh

main() {
  local wd=$HOME/temp
  local s=temp
  cd $wd
  
  tmux_new_session -d -s $s -n "main"
  tmux_send_keys -t $s:1 "vii README.md" C-m
  #---------------------------------------------------------------------------
  tmux_new_window -t $s:2 -n "server"
  tmux_send_keys -t $s:2 "npm run dev" C-m
  #---------------------------------------------------------------------------
  tmux_select_window -t $s:1
  tmux_attach -t $s:1 
}

main
