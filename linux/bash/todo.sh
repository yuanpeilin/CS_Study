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
    while read -r line
    do
        echo -e " $i $line"
        i=$((i+1))
    done < ~/.todo
    unset i line
}

todo_getopts(){
    while getopts ":a:cd:h:lr:R:" arg
    do
        case "$arg" in
            a)
                date=$(date +'%Y/%m/%d')
                echo "[ ] \e[1m $OPTARG     $date \e[0m" >> ~/.todo
                unset date
                todo_list_task
                ;;
            c)
                line_list=$(grep -n '[*]' ~/.todo | cut -d ":" -f 1)
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
                unset temp
                todo_list_task
                ;;
            l)
                todo_list_task;;
            r)
                temp=$(sed -n "$OPTARG"p ~/.todo)
                if_done=$(echo $temp | grep '[*]' | wc -l)
                if [ $if_done -eq 0 ]; then
                    echo -e "\e[1;31m WARNING: \e[0m task is not finished! Use -R instead."
                else
                    sed -i "$OPTARG"d ~/.todo
                    todo_list_task
                fi
                unset temp if_done
                ;;
            R)
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
    if [ "$#" -eq 0 ]; then
        todo_help
    else
        todo_getopts "$@"
    fi
}

main "$@"
