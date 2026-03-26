# MANPAGER fallback chain: nvim -> batman -> less -> default
if command -v nvim >/dev/null 2>&1; then
  export MANPAGER='nvim +Man! -'
elif command -v batman >/dev/null 2>&1; then
  eval "$(batman --export-env)"
else
  export MANPAGER="less -R --use-color -Dd+r -Du+b"
fi
