cd() {
  if command -v z >/dev/null 2>&1; then
    z "$@"
    if [ $? -ne 0 ]; then
      builtin cd "$@"
    fi
  else
    builtin cd "$@"
  fi
  # always list contents after cd
  ls
}
