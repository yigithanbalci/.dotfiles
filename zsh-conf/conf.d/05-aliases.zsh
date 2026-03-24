# Aliases

# Brew upgrade — clears zsh init cache so updated tools regenerate on next shell
#TODO: do similar thing for linux as well 
# maybe change brew upgrade to clear cache too instead of 
# new command 
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias brewup='brew update && brew upgrade && rm -rf "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/"'
fi

alias emacs='emacsclient -c -a ""'
alias jvim="nvim --cmd 'set runtimepath^=\$HOME/.config/jvim'"
alias gitlog='git log --oneline --graph --decorate --all'
alias gitrebase='git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges'
