# PATH setup

# OS-specific paths
if [[ "$(uname -s)" == "Darwin" ]]; then
  addToPath /opt/homebrew/bin
  addToPath /opt/homebrew/opt/llvm/bin
  _cached_eval brew '/opt/homebrew/bin/brew shellenv' /opt/homebrew/bin/brew

  # `brew shellenv` exports FPATH, so nested shells (and long-lived tmux
  # servers whose panes inherit their startup env) inherit it verbatim
  # instead of recomputing it from the currently running zsh binary. That
  # both duplicates entries on every nesting level and, after a `brew
  # upgrade zsh`, keeps pointing at the now-deleted old version's function
  # dir (breaks compinit/is-at-least/add-zsh-hook/etc, e.g. tmux/sesh's
  # `exec zsh -l`). Drop stale/duplicate entries, make sure the currently
  # running zsh's own function dir is present (it's normally only added
  # automatically when FPATH is unset at startup, which isn't the case
  # once it's been inherited this way), then keep fpath local again.
  local _fp _zsh_fns="/opt/homebrew/Cellar/zsh/${ZSH_VERSION}/share/zsh/functions"
  local _clean_fpath=()
  [[ -d "$_zsh_fns" ]] && _clean_fpath+=("$_zsh_fns")
  for _fp in $fpath; do
    [[ -d "$_fp" ]] && _clean_fpath+=("$_fp")
  done
  fpath=($_clean_fpath)
  typeset -U fpath
  unset _fp _zsh_fns _clean_fpath
  typeset +x FPATH

  # OpenJDK
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

  # Ruby (gem path cached — invalidate with: rm ~/.cache/zsh/gem_dir)
  if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
    export PATH=/opt/homebrew/opt/ruby/bin:$PATH
    local _gem_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/gem_dir"
    if [[ ! -f "$_gem_cache" ]]; then
      command mkdir -p "${_gem_cache:h}"
      gem environment gemdir > "$_gem_cache"
    fi
    export PATH="$(< "$_gem_cache")/bin:$PATH"
  fi
fi

# Cross-platform paths
addToPath /usr/local/bin
addToPath /usr/local/go/bin
addToPath $HOME/.local/bin
addToPath $HOME/.local/scripts/
addToPath $HOME/.cargo/bin
addToPath $HOME/go/bin
addToPath $HOME/.config/emacs/bin
addToPath $JAVA_HOME/bin
addToPath $HOME/programs/flutter/bin/
