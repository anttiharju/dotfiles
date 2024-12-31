#!/usr/bin/env bash

# for calibrating color themes

for i in {0..15}; do
  if [ "$i" -lt 10 ]; then
    idx=" $i"
  else
    idx="$i"
  fi
  echo -e "$idx \033[38;5;${i}m█\033[0m"
done
