#!/bin/bash

clear
declare -a list
if [ -e programs/ssh-manager/list.txt ]; then
	echo "saved list exists, coninuing"

else
	echo "saved list does not exist in directory, creating.."
	touch programs/ssh-manager/list.txt
fi
echo
echo

list=()

while read -r task; do
	list+=("$task")
done < programs/ssh-manager/list.txt

connect() {
	clear
	if [ ${#list[@]} -eq 0 ]; then
		echo "List is empty, populate by adding some (2)"
	else
		echo "Select a connection:"
		displayList
		read -p ">" choice

		if [ $choice -gt ${#list[@]} ] || [ $choice -lt 1 ]; then
			echo "Invalid choice"
		
		else
			connection=${list[$(($choice - 1))]}
			ssh -p ${connection[@]}
		fi
	fi
	echo
	echo
}



addToList() {
	echo "ip address:"
	read -p ">" ip_addr
	echo "username:"
	read -p ">" username
	echo "port (leave blank for default 22):"
	read -p ">" port 
	port=${port:-22}
	list+=("$port $username@$ip_addr")
	clear
	echo
	echo
	saveList
}


displayList() {
	clear
	var=1
	if [ ${#list[@]} -eq 0 ]; then
		echo "List empty"
	else
		echo "ssh list"
		for ((i=0;i<${#list[@]};i++)); do
			echo "-${var}. ${list[$i]}"
			var=$((var+1))
		done
	fi
	echo
	echo

}


editList() {
	clear
	if [ ${#list[@]} -eq 0 ]; then 
		echo "List is empty, add entries by selecting "add to list""
	else
		echo "select a connection to edit:"
		displayList
		read -p ">" choice

	if [ $choice -gt $#list[@]} ] || [ $choice -lt 1 ]; then
		echo "Invalid choice"
	else
		connection=${list[$((choice - 1))]}
		echo "Current connection: ${connection[@]}"
		read -p "enter the new connection string:" new_connection
		list[$(($choice -1))]=$new_connection
		clear
		echo
		echo "connection updated"
		displayList
	fi
	fi
	echo
	echo

}

saveList() {
	clear
	echo -n "" > programs/ssh-manager/list.txt
	for list in "${list[@]}"; do
		echo "$list" >> programs/ssh-manager/list.txt
	done
	echo
	echo "saved successfully"
}


removeList() {
	if [ ${#list[@]} -eq 0 ]; then
		echo "Nothing to remove"
	else
		printf " connection to remove ('all' to clear list): "
		read remlist
		if [ $remlist -gt ${#list[@]} ] || [ $remlist -lt 1 ]; then
			echo "invalid choice"
		elif [ "$remlist" = "all" ]; then
			echo "you will not be able to get the list back,"
			echo -n "are you sure?(y/n) "
			read -p ">" confirm
			if [ "$confirm" = "y" ]; then 
				list=()
				clear
				echo "Saved connections removed"
			else
				clear
				echo "Aborting"
			fi
		else
			unset 'list[$(($remlist - 1))]'
			list=("${list[@]}")
			clear
			echo "saved connection removed"
			displayList
		fi
	fi
	echo 
	echo

}


clear1() {

    clear

}


echo

while true; do

    echo "FR3E'S COME SCI PROJECT: SSH CONNECTION MANAGER"
    echo
    echo "disclaimer: not a safe way to store ssh connections"
    echo "due to the file not being encrypted (for now)"
    echo "made for educational purposes"
    echo
    echo "Select an option:"
    echo "1: connect"
    echo "2: add to list"
    echo "3: edit list"
    echo "4: display list"
    echo "5: save"
    echo "6: remove from list"
    echo
    echo "9: clear"
    echo "0: exit"

    echo

    read -p ">" choice


    case $choice in

        1) connect ;;
        2) addToList ;;
	3) editList ;;
        4) displayList ;;
        5) saveList ;;
        6)removeList ;;


        9) clear1 ;;
        0) echo "Exiting"; exit 0 ;;
        *) clear; echo "Invalid choice" ;;

    esac
done
