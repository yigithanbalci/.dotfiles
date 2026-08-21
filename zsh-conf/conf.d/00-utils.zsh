# Utility functions needed by subsequent config files

addToPath() {
  if [ -z "$1" ]; then
    return 1
  fi

  if [ ! -d "$1" ]; then
    return 1
  fi

  if [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$PATH:$1"
  fi
}

# Cache the output of slow "tool init" commands.
# Rebuilds when: cache missing, binary newer than cache, or cache older than max_age_days.
# Usage: _cached_eval <name> '<command>' [binary_path]
_cached_eval() {
  local name=$1 cmd=$2
  local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/${name}.zsh"
  local bin_path="${3:-$(command -v $name 2>/dev/null)}"
  local max_age_days=14

  if [[ ! -f "$cache" ]] \
    || { [[ -n "$bin_path" && -e "$bin_path" ]] && [[ "$bin_path" -nt "$cache" ]]; } \
    || [[ -z "$(find "$cache" -maxdepth 0 -mtime -${max_age_days} 2>/dev/null)" ]]; then
    command mkdir -p "${cache:h}"
    eval "$cmd" > "$cache" 2>/dev/null
  fi
  # fzf's `--zsh` output snapshots/restores shell options via zsh/parameter's
  # $options array, which always includes `zle`; zsh forbids setting that
  # option directly, so it errors on every shell start regardless of cache
  # content. Harmless (bindings/completion still work) - just silence it.
  source "$cache" 2> >(grep -v "can't change option: zle" >&2)
}
