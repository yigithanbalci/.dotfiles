mkdir() {
  command mkdir "$@" && __zoxide_seed_invalidate
}