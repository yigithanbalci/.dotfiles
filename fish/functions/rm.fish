function rm --wraps rm
    command rm $argv; and __zoxide_seed_refresh
end