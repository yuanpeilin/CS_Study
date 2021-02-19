path=/var/todo/todo

todo_help() {
    echo -e "\e[1m Usage: \e[0m"
    echo -e "    -a <string>   add a task"
    echo -e "    -c            clear all finished tasks"
    echo -e "    -d <number>   done"
    echo -e "    -h            help"
    echo -e "    -i            edit data file: /var/todo/todo"
    echo -e "    -l            list all tasks"
    echo -e "    -L            list all tasks with time"
    echo -e "    -r <number>   remove the finished task"
    echo -e "    -R <number>   force remove the task"
}

todo_list_task() {
    i=1
    while read -r line; do
        status=${line:0:1}
        content=${line:13}
        if [[ "$#" == 1 && "$1" == "time" ]]; then
            date=${line:2:10}
        fi
        if [[ "$status" == "U" ]]; then
            printf "\e[01m%-2s %s %s \n\e[00m" "$i [ ]" "$content" "   $date"
        else
            printf "\e[09m%-2s %s %s \n\e[00m" "$i [*]" "$content" "   $date"
        fi
        i=$((i + 1))
    done <"$path"
    unset i line status content date
}

todo_getopts() {
    while getopts ":a:cd:hiLlr:R:" arg; do
        case "$arg" in
        a) # Add
            date=$(date +'%Y/%m/%d')
            echo "U $date $OPTARG" >>"$path"
            unset date
            todo_list_task
            ;;
        c) # Clean
            line_list=$(grep -nE --text '^D' "$path" | cut -d ":" -f 1)
            i=0
            for var in $line_list; do
                var=$((var - i))
                sed -i "$var"d "$path"
                i=$((i + 1))
            done
            unset var i line_list
            todo_list_task
            ;;
        d) # Done
            temp="$OPTARG"'s/U/D/'
            sed -i "$temp" "$path"
            unset temp
            todo_list_task
            ;;
        i) # edit
            vim "$path" ;;
        l) # List
            todo_list_task ;;
        L) # List with time
            todo_list_task "time" ;;
        r) # Remove
            if_done=$(sed -n "$OPTARG"p "$path" | cut -d " " -f 1)
            if [[ "$if_done" == U ]]; then
                echo -e "\e[1;31m WARNING: \e[0m task is not finished! Use -R instead."
            else
                sed -i "$OPTARG"d "$path"
                todo_list_task
            fi
            unset if_done
            ;;
        R) # force Remove
            sed -i "$OPTARG"d "$path"
            todo_list_task
            ;;
        *)
            todo_help
            ;;
        esac
    done
    unset arg temp OPTARG OPTIND
}

main() {
    if [[ "$#" == 0 ]]; then
        todo_help
    else
        todo_getopts "$@"
    fi
}

main "$@"
unset path
