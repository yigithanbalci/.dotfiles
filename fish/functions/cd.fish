# use z if available, otherwise fallback to builtin cd
# do ls afterwards
function cd
    if type -q z
        z $argv
        if test $status -ne 0
            builtin cd $argv
        end
    else
        builtin cd $argv
    end
    # list contents after changing dir
    ls
end
