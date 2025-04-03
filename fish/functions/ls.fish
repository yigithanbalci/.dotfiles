function ls --wraps=ls --description 'Use eza if available, fallback to builtin ls'
    if type -q eza
        command eza $argv
        or command ls $argv
    else
        command ls $argv
    end
end
