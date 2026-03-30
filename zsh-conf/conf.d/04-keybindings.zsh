# Keybindings

bindkey -v

# Ctrl-F: tv projects or tmux-sessionizer
#NOTE: for future reference: Use zle -U instead of accept-line
# to ensure 'tv' and 'tmux' get proper TTY access when
# triggered via a bindkey.
_tv_projects_or_sessionizer() {
  LBUFFER=""
  RBUFFER=""

  if command -v tv &>/dev/null; then
    zle -U "tv sesh-session
"
  else
    zle -U "tmux-sessionizer
"
  fi
}
zle -N _tv_projects_or_sessionizer
bindkey '^f' _tv_projects_or_sessionizer

# Ctrl-R: tv history or fzf
_tv_history_or_fzf() {
  if command -v tv &>/dev/null; then
    local output
    output=$(tv zsh-history --input "$LBUFFER")
    if [[ -n "$output" ]]; then
      RBUFFER=""
      LBUFFER="$output"
      zle redisplay
    fi
  else
    zle fzf-history-widget
  fi
}
zle -N _tv_history_or_fzf
bindkey '^r' _tv_history_or_fzf

# Carapace menu navigation
bindkey -M menuselect '^P' up-line-or-history
bindkey -M menuselect '^N' down-line-or-history

# Open the current command in your $EDITOR (e.g., neovim)
# Press Ctrl+X followed by Ctrl+E to trigger
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Map undo again bcz it is overridden by vi mode
# use <esc>+u for undo in vi mode
bindkey -M viins '^_' undo

# Expands history expressions like !! or !$ when you press space
# default is <tab> 
bindkey ' ' magic-space

# Custom Widgets
# Clear screen but keep current command buffer
clear-screen-and-scrollback() {
  echoti civis >"$TTY"
  printf '%b' '\e[H\e[2J\e[3J' >"$TTY"
  echoti cnorm >"$TTY"
  zle redisplay
}
zle -N clear-screen-and-scrollback
bindkey '^Xl' clear-screen-and-scrollback

# Copy current command buffer to clipboard
# macOS: pbcopy | Linux: wl-copy (Wayland) > xclip (X11) > xsel (X11 fallback)
copy-buffer-to-clipboard() {
  if [[ "$OSTYPE" == darwin* ]]; then
    echo -n "$BUFFER" | pbcopy
  elif command -v wl-copy &>/dev/null; then
    echo -n "$BUFFER" | wl-copy
  elif command -v xclip &>/dev/null; then
    echo -n "$BUFFER" | xclip -selection clipboard
  elif command -v xsel &>/dev/null; then
    echo -n "$BUFFER" | xsel --clipboard --input
  else
    zle -M "No clipboard tool found"
    return 1
  fi
  zle -M "Copied to clipboard"
}
zle -N copy-buffer-to-clipboard
bindkey '^Xc' copy-buffer-to-clipboard

# Hotkey Insertions - Text Snippets (uses git aliases from .gitconfig)
# Use ZLE widgets (LBUFFER/RBUFFER) for cursor positioning since
# vi mode doesn't bind \C-b to backward-char like emacs mode does.
# \n in bindkey -s strings executes immediately.
_insert_git_commit() {
  LBUFFER='git cm "'
  RBUFFER='"'
}
zle -N _insert_git_commit
bindkey '^Xgc' _insert_git_commit   # signed commit with message (cm alias)
bindkey -s '^Xgp' 'git push origin '
bindkey -s '^Xgs' 'git st\n'        # status (st alias)
bindkey -s '^Xgl' 'git lg -10\n'    # compact log with graph (lg alias)
