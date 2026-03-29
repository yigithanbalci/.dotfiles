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
    zle -U "tv tmux-sessionizer
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

# Map undo again bcz it is overriden by vi mode 
# use <esc>+u for undo in vi mode
bindkey -M viins '^_' undo

# Expands history expressions like !! or !$ when you press space
# default is <tab> 
bindkey ' ' magic-space
