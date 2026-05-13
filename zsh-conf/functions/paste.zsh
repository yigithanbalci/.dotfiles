paste() {
  if command -v pbpaste >/dev/null 2>&1; then
    # macOS
    pbpaste
  elif [[ -n "$WAYLAND_DISPLAY" ]] && command -v wl-paste >/dev/null 2>&1; then
    # Linux Wayland
    wl-paste
  elif command -v xclip >/dev/null 2>&1; then
    # Linux X11 (xclip)
    xclip -selection clipboard -o
  elif command -v xsel >/dev/null 2>&1; then
    # Linux X11 (xsel)
    xsel --clipboard --output
  elif command -v wl-paste >/dev/null 2>&1; then
    # Linux Wayland (fallback when WAYLAND_DISPLAY unset)
    wl-paste
  else
    echo "No clipboard utility found. Install xclip, xsel, or wl-clipboard." >&2
    return 1
  fi
}
