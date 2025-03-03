# Only run this in interactive shells
if status is-interactive

    # I'm trying to grow a neckbeard
    # fish_vi_key_bindings
    # Set the cursor shapes for the different vi modes.
    set fish_cursor_default block
    set fish_cursor_insert block
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block

    fish_set_user_paths
    fish_user_key_bindings
end

source $HOME/.config/fish/settings.fish
source $HOME/.config/fish/env.vars.fish

fzf --fish | source

starship init fish | source
