set fish_greeting
fish_vi_key_bindings
fish_hybrid_key_bindings

eval "$(/opt/homebrew/bin/brew shellenv)"

set -lx machineconfig "$HOME/anttiharju/dotfiles/machine/config.fish"
if test -f "$machineconfig"
  source "$machineconfig"
end

if status --is-interactive
  if not ssh-add -l >/dev/null 2>&1
    # this is slow, hence the if condition
    ssh-add --apple-load-keychain 2> /dev/null
  end
  alias k="kubectl"

  set -gx PATH /Users/antti/anttiharju/utils/bin $PATH

  set -gx OG_INITIAL_DIR (pwd)
  function og
    cd $OG_INITIAL_DIR
  end

  # lefthook auto-install for personal repositories
  set current_dir (pwd)
  if string match -q "$HOME/anttiharju/*" $current_dir
    if test -f "lefthook.yml"
      lefthook install
    end
  end
end
