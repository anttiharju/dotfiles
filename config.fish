# Default flox env collides with `code .` usage, so rely on brew for now
eval "$(/opt/homebrew/bin/brew shellenv)"

set fish_greeting
fish_vi_key_bindings
fish_hybrid_key_bindings

if status --is-interactive
  alias kc="kubectl"
  alias tc="talosctl"
  alias golangci-lint="/opt/homebrew/bin/vmatch"
  # Custom utils
  set -gx PATH /Users/antti/anttiharju/utils/bin $PATH

  # Activate flox upon VS Code integrated terminal initialisation
  if git rev-parse --git-dir >/dev/null 2>&1
    # In git repo
    set GIT_ROOT (git rev-parse --show-toplevel)
    if test -d "$GIT_ROOT/.flox"
      set CURRENT (echo "$FLOX_ENV" | sed 's/\.flox.*/.flox/')
      set AVAILABLE "$GIT_ROOT/.flox"
      if test $CURRENT != $AVAILABLE
        flox activate -d $GIT_ROOT
      end
    end
  else if test -d ./.flox
    # Local .flox fallback
    set CURRENT (echo "$FLOX_ENV" | sed 's/\.flox.*/.flox/')
    set AVAILABLE "$(pwd)/.flox"
    if test $CURRENT != $AVAILABLE
      flox activate -d .
    end
  end
end
