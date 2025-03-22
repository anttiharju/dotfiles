set fish_greeting
fish_vi_key_bindings
fish_hybrid_key_bindings

eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx PATH /Users/antti/anttiharju/scripts $PATH

if test -z "$SSH_AUTH_SOCK"
  eval $(ssh-agent -c)
end

set -lx machineconfig "$HOME/anttiharju/dotfiles/config.machine.fish"
if test -f "$machineconfig"
  source "$machineconfig"
end

if status --is-interactive
  alias kc="kubectl"
  alias tc="talosctl"
end
