## Zoxide seed — pre-load zoxide with project directories from tmux-sessionizer paths.
## Cached for speed; cache refreshed by mkdir, rm, and git clone wrappers.
##
## NOTE: Load order — this file (zoxide-seed.zsh) must be sourced before
## git.zsh, mkdir.zsh, rm.zsh which depend on __zoxide_seed_refresh.
## Since .zsh_profile globs functions/*.zsh alphabetically, "z" sorts
## after "g/m/r" — but that's fine because those files only *define*
## functions at source time; __zoxide_seed_refresh is only *called*
## at runtime, by which point all files have been sourced.

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

__zoxide_seed_refresh() {
  command rm -f "$__ZOXIDE_SEED_CACHE"
  zoxide-seed
}

# Auto-seed on shell startup
zoxide-seed