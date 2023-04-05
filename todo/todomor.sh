#!/bin/bash

add_new_task(){
    read -p "Enter task description: " new_task
    if [ ! -f "pending_file.txt" ]; then
        echo $new_task >> pending_file.txt
        echo "Task added successfully"
    else
        echo $new_task >> pending_file.txt
        echo "Task added successfully"
    fi
}

show_pendings(){
    if [ ! -f "pending_file.txt" ]; then
        echo "No pending tasks"
    else
        cat -n pending_file.txt
    fi
}

move_to_done(){

    if [ ! -f "pending_file.txt" ]; then
        echo "No pending tasks"
    else
        cat -n pending_file.txt
        read -p "Enter the number of finished task: " number
        sed -n $number"p" pending_file.txt >> done_file.txt
        sed -i $number"d" pending_file.txt
    fi
    }


show_finished_tasks(){
    if [ ! -f "done_file.txt" ]; then
        echo "No finished tasks"
    else
        cat -n done_file.txt
    fi
}

remove_task(){
    if [ ! -f "pending_file.txt" ]; then 
        echo "no pending task to remove!"
    else 
        cat -n pending_file.txt
        read -p "enter the task number to remove: " number
        sed -n $number"p" pending_file.txt >> removed_file.txt
        sed -i $number"d" pending_file.txt
        echo "the task was succecssfully removed"
    fi   
}

search(){
    PS3="Choose the list to search"
    select choice in "Pending-tasks" "Finished-tasks" "Removed-tasks"
    do 
        read -p "enter a task to search " searched_task
        case $choice in "Finished-tasks")
            if grep -q $searched_task done_file.txt
            then
                echo "the $searched_task exists in Finished-tasks"
            else
                echo "the $searched_task does not exist in Finished-tasks"
            fi
        ;;
        "Pending-tasks")
            if grep -q $searched_task pending_file.txt
            then
                echo "the $searched_task exists in Pending-tasks"
            else
                echo "the $searched_task does not exist in Pending-tasks"
            fi
        ;;
        "Removed-tasks")
            if grep -q $searched_task removed_file.txt
            then
                echo "the $searched_task exists in Removed-tasks"
            else
                echo "the $searched_task does not exist in Removed-tasks"
            fi
        esac
    break
    done
}

PS3="Select an option: "
select option in "Add new task" "Show pending tasks" "Move finished task to done" "Show finished tasks" "remove a task" "Search in Tasks" "Exit"
do
    case $option in 
    "Add new task")
    add_new_task
    ;;
    "Show pending tasks")
    show_pendings
    ;;
    "Move finished task to done")
    move_to_done
    ;;
    "Show finished tasks")
    show_finished_tasks
    ;;
    "Remove a task")
    remove_task
    ;;
    "Search in tasks")
    search
    ;;
    "Exit")
    exit
    esac
done

