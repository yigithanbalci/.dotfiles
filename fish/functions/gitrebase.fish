function gitrebase
    git rebase --interactive --autostash --keep-empty --no-autostash --rebase-merges $argv
end
