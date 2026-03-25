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
# Auto-invalidates when the tool binary is newer than the cache.
# Usage: _cached_eval <name> '<command>' [binary_path]
_cached_eval() {
  local name=$1 cmd=$2
  local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/${name}.zsh"
  local bin_path="${3:-$(command -v $name 2>/dev/null)}"

  if [[ ! -f "$cache" ]] || { [[ -n "$bin_path" && -e "$bin_path" ]] && [[ "$bin_path" -nt "$cache" ]]; }; then
    command mkdir -p "${cache:h}"
    eval "$cmd" > "$cache"
  fi
  source "$cache"
}
