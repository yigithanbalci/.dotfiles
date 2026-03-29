# Global Aliases - Use Anywhere in Commands

# Redirect stderr to /dev/null
alias -g NE='2>/dev/null'

# Redirect stdout to /dev/null
alias -g NO='>/dev/null'

# Redirect both stdout and stderr to /dev/null
alias -g NUL='>/dev/null 2>&1'

# Pipe to jq
alias -g J='| jq'

# Copy output to clipboard
# macOS: pbcopy | Linux: wl-copy (Wayland) > xclip (X11) > xsel (X11 fallback)
if [[ "$OSTYPE" == darwin* ]]; then
  alias -g C='| pbcopy'
elif command -v wl-copy &>/dev/null; then
  alias -g C='| wl-copy'
elif command -v xclip &>/dev/null; then
  alias -g C='| xclip -selection clipboard'
elif command -v xsel &>/dev/null; then
  alias -g C='| xsel --clipboard --input'
fi
