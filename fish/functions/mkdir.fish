function mkdir --wraps mkdir
    command mkdir $argv; and __zoxide_seed_refresh
end