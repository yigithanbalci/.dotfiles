# cx <dir> → cd into dir and ls contents
function cx
    if test (count $argv) -eq 0
        echo "Usage: cx <directory>"
        return 1
    end

    cd $argv[1]; or return
    ls
end
