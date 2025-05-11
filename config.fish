set fish_greeting
fish_vi_key_bindings
fish_hybrid_key_bindings

eval "$(/opt/homebrew/bin/brew shellenv)"

set -lx machineconfig "$HOME/anttiharju/dotfiles/machine/config.fish"
if test -f "$machineconfig"
  source "$machineconfig"
end

if status --is-interactive
  alias k="kubectl"

  set -gx PATH /Users/antti/anttiharju/utils/bin $PATH
  # anttiharju/utils/scripts/og.sh
  set -gx OG_INITIAL_DIR (pwd)

  # lefthook auto-install for personal repositories
  set current_dir (pwd)
  if string match -q "$HOME/anttiharju/*" $current_dir
    if test -f "lefthook.yml"
      lefthook install
    end
  end
end
