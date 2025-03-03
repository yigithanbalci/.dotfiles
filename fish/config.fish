# Only run this in interactive shells
if status is-interactive
    fish_set_user_paths
    fish_user_key_bindings
end

source $HOME/.config/fish/settings.fish
source $HOME/.config/fish/env.vars.fish

fzf --fish | source

starship init fish | source
