# Only run this in interactive shells
if status is-interactive
    fish_set_user_paths
    fish_user_key_bindings
end

type -q batman; and batman --export-env | source
type -q zoxide; and zoxide init fish | source

source $HOME/.config/fish/settings.fish
source $HOME/.config/fish/env.vars.fish

type -q fzf; and fzf --fish | source

type -q starship; and starship init fish | source
if status is-interactive
    # Do not run fastfetch if inside Neovim jobs (check for NVIM env var)
    if not set -q NVIM
        type -q fastfetch; and fastfetch
    end
end

# carapace
# seems like not needed in fish that much atleast for now
type -q carapace; and carapace init fish | source
# carapace _carapace | source
