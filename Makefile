.PHONY: setup install-ghostty-theme clean

setup: install_ghostty_theme
	git config --local core.hooksPath .githooks/
	ln -f ./com.mitchellh.ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
	ln -f ./.tmux.conf ~/.tmux.conf
	ln -f ./.aerospace.toml ~/.aerospace.toml
	ln -f ./config.fish ~/.config/fish/config.fish

install_ghostty_theme: /Applications/Ghostty.app/Contents/Resources/ghostty/themes/dark-vscode-integrated

/Applications/Ghostty.app/Contents/Resources/ghostty/themes/dark-vscode-integrated:
	cp ./misc/dark-vscode-integrated /Applications/Ghostty.app/Contents/Resources/ghostty/themes/dark-vscode-integrated

clean:
	rm -f /Applications/Ghostty.app/Contents/Resources/ghostty/themes/dark-vscode-integrated
