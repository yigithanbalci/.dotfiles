# use eza instead of ls if available
# ls -G is the default alias for whatever reason
unalias ls 2>/dev/null
ls() {
  if command -v eza >/dev/null 2>&1; then
    eza "$@" || command ls -G "$@"
  else
    command ls -G "$@"
  fi
}
