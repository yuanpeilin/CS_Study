todo_help(){
    echo -e "\e[1m Usage: \e[0m"
    echo -e "    -a <string>   add a task"
    echo -e "    -c            clear all finished tasks"
    echo -e "    -d <number>   done"
    echo -e "    -h            help"
    echo -e "    -l            list all tasks"
    echo -e "    -L            list all tasks with time"
    echo -e "    -r <number>   remove the finished task"
    echo -e "    -R <number>   force remove the task"
}

todo_list_task(){
    i=1
    while read -r line; do
        status=$(echo "$line" | awk -F '::' '{print $1}')
        content=$(echo "$line" | awk -F '::' '{print $2}')
        if [[ "$#" == 1 && "$1" == "time" ]]; then
            date=$(echo "$line" | awk -F '::' '{print $3}')
        fi
        if [[ "$status" == "U" ]]; then
            printf "\e[01m%b %b %b \n\e[00m" "$i [ ]" "${content:0:30}" "   $date"
        else
            printf "\e[09m%b %b %b \n\e[00m" "$i [*]" "${content:0:30}" "   $date"
        fi
        i=$((i+1))
    done < ~/.todo
    unset i line status content date
}

todo_getopts(){
    while getopts ":a:cd:h:Llr:R:" arg; do
        case "$arg" in
            a) # Add
                date=$(date +'%Y/%m/%d')
                echo "U::$OPTARG::$date" >> ~/.todo
                unset date
                todo_list_task
                ;;
            c) # Clean
                line_list=$(grep -n --text 'D::' ~/.todo | cut -d ":" -f 1)
                i=0
                for var in $line_list
                do
                    var=$((var-i))
                    sed -i "$var"d ~/.todo
                    i=$((i+1))
                done
                unset var i line_list
                todo_list_task
                ;;
            d) # Done
                temp="$OPTARG"'s/U::/D::/g'
                sed -i "$temp" ~/.todo
                unset temp
                todo_list_task
                ;;
            l) # List
                todo_list_task;;
            L) # List with time
                todo_list_task "time";;
            r) # Remove
                temp=$(sed -n "$OPTARG"p ~/.todo)
                if_done=$(echo "$temp" | grep -c 'D::')
                if [[ "$if_done" == 0 ]]; then
                    echo -e "\e[1;31m WARNING: \e[0m task is not finished! Use -R instead."
                else
                    sed -i "$OPTARG"d ~/.todo
                    todo_list_task
                fi
                unset temp if_done
                ;;
            R) # force Remove
                sed -i "$OPTARG"d ~/.todo
                todo_list_task
                ;;
            *)
                todo_help;;
        esac
    done
    unset arg temp OPTARG OPTIND
}

main(){
    if [[ "$#" == 0 ]]; then
        todo_help
    else
        todo_getopts "$@"
    fi
}

main "$@"
