function lsss -d "ls show size"
    # check for argvs. First argv should be a path, second should be a number
    # if no second is specified, default to 10
    # if second equals to "-a", do the logic differently
    # if no argvs, set argv[1] to current directory
    set show_all 0
    set limit 10
    set dir "."

    switch (count $argv)
        case 0
        case 1
            if test $argv[1] = -a
                set show_all 1
            else if string match -qr '^[0-9]+$' $argv[1]
                set limit $argv[1]
            else if test -d $argv[1]
                set dir $argv[1]
            else
                echo "Error: '$argv[1]' is not a valid directory or option"
                return 1
            end
        case 2
            if test -d $argv[1]
                set dir $argv[1]
                if test $argv[2] = -a
                    set show_all 1
                else if string match -qr '^[0-9]+$' $argv[2]
                    set limit $argv[2]
                else
                    echo "Error: the second argument must be a number or '-a'"
                    return 1
                end
            else
                echo "Error: '$argv[1]' is not a valid directory"
                return 1
            end
    end

    if test $show_all -eq 1
        du -sh $dir/* | sort -h
    else
        du -sh $dir/* | sort -h | head -n $limit
    end
    du -sh $dir
end
