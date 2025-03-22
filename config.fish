# Default flox env collides with `code .` usage, so rely on brew for now
eval "$(/opt/homebrew/bin/brew shellenv)"

set fish_greeting
fish_vi_key_bindings
fish_hybrid_key_bindings

if status --is-interactive
  alias kc="kubectl"
  alias tc="talosctl"
  if test -z "$SSH_AUTH_SOCK"
    eval $(ssh-agent -c)
  end
  # Custom utils
  set -gx PATH /Users/antti/anttiharju/scripts $PATH # not using fish_add_path because this needs to override other things (some brew bin overlap with gpr)

  set -lx machineconfig "$HOME/anttiharju/dotfiles/config.machine.fish"
  if test -f "$machineconfig"
    source "$machineconfig"
  end
end
