
#/bin/bash

select-menu() {
	echo "select an option:"
	echo "[1]"
	echo "[2]"
	echo "[3]"
}

select-programs() {
	echo "type out what program you wish to use:"
	echo
	ls programs/
	echo
	read -p ">" choice

	if [ -d programs/$choice ]; then
		bash programs/$choice/settings.sh
	else
		echo "Program does not exist, exiting.."
	fi
}

create-program() {
	clear
	echo "enter a name"
	read -p ">" choice
	echo
	if [! -d $choice ];then 
		echo "making directory"
		mkdir programs/$choice
	else
		echo "directory already exists, exiting"
	fi


}


bash "install-dependancies.sh"
clear
echo "FR3E'S AP COMP SCI 20-1 PROJECT" 
echo
echo "select an option:"
echo "[1] - select program(s)"
echo "[2] - create a program"
