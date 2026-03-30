## Zoxide seed — pre-load zoxide with project directories from tmux-sessionizer paths.
## Cached for speed; cache refreshed by mkdir, rm, and git clone wrappers.

set -g __ZOXIDE_SEED_CACHE (set -q XDG_CACHE_HOME; and echo $XDG_CACHE_HOME; or echo $HOME/.cache)/fish/zoxide-seed.list

function __zoxide_seed_dirs
    find \
        ~/ \
        ~/flutter_projects \
        ~/Workspace/exercise/algo \
        ~/Workspace/exercise/exercism \
        ~/work \
        ~/work/az-repos \
        ~/personal \
        ~/personal/yt \
        ~/devenv \
        ~/devenv/dotfiles \
        ~/.dotfiles \
        -mindepth 1 -maxdepth 1 -type d 2>/dev/null
end

function zoxide-seed
    if not type -q zoxide
        return 1
    end

    # Use cache to avoid rerunning `find`; always (re)seed zoxide from the list.
    if not test -f $__ZOXIDE_SEED_CACHE
        command mkdir -p (dirname $__ZOXIDE_SEED_CACHE)
        __zoxide_seed_dirs >$__ZOXIDE_SEED_CACHE
    end

    while read -l dir
        zoxide add $dir
    end <$__ZOXIDE_SEED_CACHE
end

function __zoxide_seed_refresh
    command rm -f $__ZOXIDE_SEED_CACHE
    zoxide-seed
end