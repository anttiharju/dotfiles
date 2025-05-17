#!/bin/sh

# Todo: consider soft symlinks
ln -f ./com.mitchellh.ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -f ./.tmux.conf ~/.tmux.conf
ln -f ./.aerospace.toml ~/.aerospace.toml
ln -f ./config.fish ~/.config/fish/config.fish
ln -f ./com.microsoft.VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -f ./.gitconfig ~/.gitconfig
mkdir -p ~/.config/git
ln -f ./.global.gitignore ~/.config/git/ignore
[ -f "./machine/config.sh" ] && ./machine/config.sh || true

for completion_file in ./fish/completions/*.fish; do
  if [ -f "$completion_file" ]; then
    command_name=$(basename "$completion_file" .fish)

    if command -v "$command_name" >/dev/null 2>&1; then
      echo "$command_name"
      cp "$completion_file" "$HOME/.config/fish/completions/"
    fi
  fi
done
