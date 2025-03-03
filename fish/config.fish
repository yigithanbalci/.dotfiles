# Only run this in interactive shells
if status is-interactive
    source $HOME/.config/fish/settings.fish

end

source $HOME/.config/fish/env.vars.fish

fzf --fish | source

starship init fish | source
