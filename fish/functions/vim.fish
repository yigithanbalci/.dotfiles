function vim
    if test "$argv[1]" = --real
        command vim $argv[2..-1]
    else if type -q nvim
        command nvim $argv
    else
        command vim $argv
    end
end
