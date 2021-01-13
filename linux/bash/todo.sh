todo_help(){
    echo -e "\e[1m Usage: \e[0m
    -a <string>   add a task
    -c            clear all finished tasks
    -d <number>   done
    -h            help
    -l            list all tasks
    -r <number>   remove the task"
}

todo_list_task(){
    i=1
    while read -r line
    do
        echo -e " $i $line"
        i=$((i+1))
    done < ~/.todo
    unset i line
}

todo_getopts(){
    while getopts ":a:cd:h:lr:" arg
    do
        case "$arg" in
            a)
                echo "[ ] \e[1m $OPTARG \e[0m" >> ~/.todo
                todo_list_task
                ;;
            c)
                line_list=`grep -n '[*]' ~/.todo | cut -d ":" -f 1`
                i=0
                for var in $line_list
                do
                    var=$((var-i))
                    sed -i "$var"d ~/.todo
                    let i++
                done
                unset var i line_list
                todo_list_task
                ;;
            d)
                temp="$OPTARG"'s/\[ \] \\e\[1m/\[\*\] \\e\[9m/g'
                sed -i "$temp" ~/.todo
                todo_list_task
                ;;
            l)
                todo_list_task;;
            r)
                sed -i "$OPTARG"d ~/.todo
                todo_list_task
                ;;
            *)
                todo_help;;
        esac
    done
    unset arg temp OPTARG OPTIND
}

if [ "$#" -eq 0 ]; then
    todo_help
else
    todo_getopts "$@"
fi
