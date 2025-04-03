function cd
    if type -q z
        z $argv
        if test $status -ne 0
            builtin cd $argv
        end
    else
        builtin cd $argv
    end
end
