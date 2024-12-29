.PHONY: setup

setup:
	git config --local core.hooksPath .githooks/
	ln -f ./com.mitchellh.ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
	ln -f ./.tmux.conf ~/.tmux.conf
	ln -f ./.aerospace.toml ~/.aerospace.toml
	ln -f ./config.fish ~/.config/fish/config.fish
