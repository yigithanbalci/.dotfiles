function git --wraps git
    command git $argv
    set -l ret $status
    if test "$argv[1]" = clone
        __zoxide_seed_refresh
    end
    return $ret
end