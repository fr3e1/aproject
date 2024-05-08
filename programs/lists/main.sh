#!/bin/bash

#credits to chatgpt and blackbox ai for help with the code and troubleshooting

clear

declare -a todolist




if [ -f programs/lists/tasks.txt ]; then
    echo "saved tasks exist, continuing"
else
    echo "saved tasks doesn't exist, creating.."
    touch programs/lists/tasks.txt
fi

echo
echo
echo "FR3E'S COMP SCI PROJECT: TASK MANAGER"

todolist=()


while read -r task; do
	todolist+=("$task")
done < programs/lists/tasks.txt




add_task() {

	if [ ${#todolist[@]} -ge 10 ]; then
        echo "your todo list is full"
    else
        echo -n "write your task:"
        read task
        todolist+=("$task")
	clear
        display_task
	fi
	echo 
	echo
}

display_task() {
	clear
	var=1
	if [ ${#todolist[@]} -eq 0 ]; then
		echo "Your list is empty"
	else
		echo "to-do list:"
		for ((i=0;i<${#todolist[@]}; i++)); do
		
		echo "- ${var}. ${todolist[$i]}"
		var=$((var+1))
	done 
	fi
	echo
	echo
}

save_tasks() {
	clear
	echo -n "" > tasks.txt 
    
	for task in "${todolist[@]}"; do
        	echo "$task" >> tasks.txt
	done
	echo "Tasks saved to tasks.txt"
	echo
	echo
}



remove_task() {

	if [ ${#todolist[@]} -eq 0 ]; then
		echo "No tasks to remove"
	else
		echo -n "task number to remove ("all" to remove all):"

		read remtask
		if [ "$remtask" = "all" ]; then
			read -p "Are you sure? (y/n)" verify
			if [ "$verify" = "y" ]; then
				unset todolist
				todolist=()
				clear
				echo "All tasks removed"
			elif [ "$verify" = "n" ]; then
			clear
		fi

		elif [ $remtask -gt ${#todolist[@]} ] || [ $remtask -lt 1 ]; then
			echo "Invalid task number"
		
		else
			unset 'todolist[$(($remtask - 1))]'
			todolist=("${todolist[@]}")
			clear
			echo "task removed, here's"
			display_task
		fi
	fi
	echo
	echo
}

clear_1() {
	clear
}

echo
while true; do
    
    echo "Enter your choice:"
    echo "1: add task"
    echo "2: display tasks"
    echo "3: save"
    echo "4: remove a task"
    echo
    echo "options:"
    echo "9: clear cli"
    echo "0: exit"
    echo
    read -p ">" choice


    case $choice in
        1) add_task ;;
        2) display_task ;;
        3) save_tasks ;;
        4) remove_task ;;
	9) clear_1 ;;
        0) echo "Exiting..."; exit 0 ;;
	*) clear; echo "Invalid choice. Please try again." ;;
    esac
done
