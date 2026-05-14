clip() {
  if command -v pbcopy >/dev/null 2>&1; then
    # macOS
    pbcopy
  elif [[ -n "$WAYLAND_DISPLAY" ]] && command -v wl-copy >/dev/null 2>&1; then
    # Linux Wayland
    wl-copy
  elif command -v xclip >/dev/null 2>&1; then
    # Linux X11 (xclip)
    xclip -selection clipboard
  elif command -v xsel >/dev/null 2>&1; then
    # Linux X11 (xsel)
    xsel --clipboard --input
  elif command -v wl-copy >/dev/null 2>&1; then
    # Linux Wayland (fallback when WAYLAND_DISPLAY unset)
    wl-copy
  else
    echo "No clipboard utility found. Install xclip, xsel, or wl-clipboard." >&2
    return 1
  fi
}
