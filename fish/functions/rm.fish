function rm --wraps rm
    command rm $argv
    set -l ret $status
    if test $ret -eq 0
        __zoxide_seed_refresh 2>/dev/null; or true
    end
    return $ret
end