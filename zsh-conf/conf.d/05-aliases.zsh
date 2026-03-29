# Aliases

# Wrap brew — clears zsh init cache after upgrade/reinstall/install so updated tools regenerate
#TODO: do similar thing for linux as well
if [[ "$(uname -s)" == "Darwin" ]]; then
  brew() {
    command brew "$@"
    local ret=$?
    case "$1" in
      upgrade|reinstall|install)
        rm -rf "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/"
        ;;
    esac
    return $ret
  }
fi

# zmv pattern aliases
alias zcp='zmv -C'  # Copy with patterns
alias zln='zmv -L'  # Link with patterns

alias emacs='emacsclient -c -a ""'
alias jvim="nvim --cmd 'set runtimepath^=\$HOME/.config/jvim'"
