zoxide-seed() {
  if ! command -v zoxide >/dev/null 2>&1; then
    echo "zoxide not found"
    return 1
  fi

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
    -mindepth 1 -maxdepth 1 -type d 2>/dev/null \
    | xargs -I{} zoxide add '{}'

  echo "zoxide database seeded"
}