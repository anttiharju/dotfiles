#!/usr/bin/env bash

# Display terminal colors with full-width blocks
# Format: INDEX [█████] ANSI_CODE HEX_VALUE

terminal_width=$(tput cols)
terminal_height=$(tput lines)
block_width=$((terminal_width - 3 - 5)) # Leave space for idx and text
block=$(printf '█%.0s' $(seq 1 $block_width))

# Calculate padding needed (terminal height minus color blocks minus prompt)
padding_lines=$((terminal_height - 16 - 1))

# Add padding at top
for ((p=0; p<padding_lines; p++)); do
  echo
done

for i in {0..15}; do
  # Format index with padding
  if [ "$i" -lt 10 ]; then
    idx=" $i"
  else
    idx="$i"
  fi

  # Show color block in both foreground and background
  echo -e "$idx \033[38;5;${i}mcode $block\033[0m"
done
