function gitprune
    git fetch -p

    git remote prune origin

    git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D
end
