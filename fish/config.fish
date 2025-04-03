# Only run this in interactive shells
if status is-interactive
    fish_set_user_paths
    fish_user_key_bindings
end

batman --export-env | source
zoxide init fish | source

source $HOME/.config/fish/settings.fish
source $HOME/.config/fish/env.vars.fish

fzf --fish | source

starship init fish | source
if status is-interactive
    # Do not run fastfetch if inside Neovim jobs (check for NVIM env var)
    if not set -q NVIM
        fastfetch
    end
end

# carapace
# seems like not needed in fish that much atleast for now
carapace init fish | source
# carapace _carapace | source
