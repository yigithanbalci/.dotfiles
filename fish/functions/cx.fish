# use z if available, otherwise fallback to builtin cd
# don't do ls afterwards
function cx
    if type -q z
        z $argv
        if test $status -ne 0
            builtin cd $argv
        end
    else
        builtin cd $argv
    end
end
