# Todo: consider soft symlinks
setup:
	ln -f ./com.mitchellh.ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
	ln -f ./.tmux.conf ~/.tmux.conf
	ln -f ./.aerospace.toml ~/.aerospace.toml
	ln -f ./config.fish ~/.config/fish/config.fish
	ln -f ./com.microsoft.VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	ln -f ./.gitconfig ~/.gitconfig
	mkdir -p ~/.config/git
	ln -f ./.global.gitignore ~/.config/git/ignore
	@[ -f "./machine/config.sh" ] && ./machine/config.sh || true
.PHONY: setup
