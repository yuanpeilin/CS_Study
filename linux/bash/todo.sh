todo_help(){
    echo -e "\e[1m Usage: \e[0m
    -a <string>   add a task
    -c            clear all finished tasks
    -d <number>   done
    -h            help
    -l            list all tasks
    -r <number>   remove the finished task
    -R <number>   force remove the task"
}

todo_list_task(){
    i=1
    while read -r line; do
        status=$(echo "$line" | awk -F '::' '{print $1}')
        content=$(echo "$line" | awk -F '::' '{print $2}')
        date=$(echo "$line" | awk -F '::' '{print $3}')
        if [[ "$status" == "U" ]]; then
            echo  -e "$i [ ] \e[1m$content     $date\e[0m"
        else
            echo -e "$i [*] \e[9m$content     $date\e[0m"
        fi
        i=$((i+1))
    done < ~/.todo
    unset i line status content date
}

todo_getopts(){
    while getopts ":a:cd:h:lr:R:" arg; do
        case "$arg" in
            a) # Add
                date=$(date +'%Y/%m/%d')
                echo "U::$OPTARG::$date" >> ~/.todo
                unset date
                todo_list_task
                ;;
            c) # Clean
                line_list=$(grep -n 'D::' ~/.todo | cut -d ":" -f 1)
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
            d) # Done
                temp="$OPTARG"'s/U::/D::/g'
                sed -i "$temp" ~/.todo
                unset temp
                todo_list_task
                ;;
            l) # List
                todo_list_task;;
            r) # Remove
                temp=$(sed -n "$OPTARG"p ~/.todo)
                if_done=$(echo $temp | grep 'D::' | wc -l)
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
