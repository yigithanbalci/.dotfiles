## Zoxide seed — pre-load zoxide with project directories from tmux-sessionizer paths.
## Cached for speed; cache invalidated by mkdir, rm, and git clone wrappers.

__ZOXIDE_SEED_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zoxide-seed.list"

__zoxide_seed_dirs() {
  find \
    ~/ \
    ~/flutter_projects \
    ~/Workspace/exercise/algo \
    ~/Workspace/exercise/exercism \
    ~/work \
    ~/work/az-repos \
    ~/personal \
    ~/personal/yt \
    ~/devenv \
    ~/devenv/dotfiles \
    ~/.dotfiles \
    -mindepth 1 -maxdepth 1 -type d 2>/dev/null
}

zoxide-seed() {
  if ! command -v zoxide >/dev/null 2>&1; then
    return 1
  fi

  if [[ ! -f "$__ZOXIDE_SEED_CACHE" ]]; then
    command mkdir -p "${__ZOXIDE_SEED_CACHE:h}"
    __zoxide_seed_dirs > "$__ZOXIDE_SEED_CACHE"
  fi

  while IFS= read -r dir; do
    zoxide add "$dir"
  done < "$__ZOXIDE_SEED_CACHE"
}

__zoxide_seed_invalidate() {
  command rm -f "$__ZOXIDE_SEED_CACHE"
}

# Auto-seed on shell startup
zoxide-seed