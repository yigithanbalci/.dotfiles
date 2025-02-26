if status is-interactive
    # Commands to run in interactive sessions can go here
end

source $HOME/.config/fish/settings.fish
source $HOME/.config/fish/env.vars.fish
fish_set_user_paths
fish_user_key_bindings

fzf --fish | source

starship init fish | source
