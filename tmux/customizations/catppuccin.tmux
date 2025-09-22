set -g @catppuccin_window_text ' #(bash -lc "git -C \"#{pane_current_path}\" rev-parse --show-toplevel 2>/dev/null | xargs -n1 basename || basename \"#{pane_current_path}\"")'
set -g @catppuccin_window_current_text ' #(bash -lc "git -C \"#{pane_current_path}\" rev-parse --show-toplevel 2>/dev/null | xargs -n1 basename || basename \"#{pane_current_path}\"")'
