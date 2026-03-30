rm() {
  command rm "$@" && __zoxide_seed_invalidate
}