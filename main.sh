b
#/bin/bash

selectPrograms() {
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

createProgram() {
	clear
	echo "enter a name"
	read -p ">" choice
	echo
	if [! -d programs/$choice ];then 
		echo "making directory"
		mkdir programs/$choice
	else
		echo "directory already exists, exiting"
	fi
	if [ -d programs/$choice ]; then
		echo "directory made"
	else
		echo "directory was not made and/or missing"
	fi
	echo > programs/$choice/main.sh <<EOF
#!/bin/bash
#write your code here

start() {

}

EOF

echo "main.sh created"
}

while true; do

	bash "install-dependancies.sh"
	clear
	echo "FR3E'S AP COMP SCI 20-1 PROJECT" 
	echo
	echo "select an option:"
	echo "[1] - select program"
	#echo "[2] - create a program"
	echo
	echo "[0] - exit"
	read -p ">" choice2
	case $choice2 in
		1)selectPrograms ;;
		2)createProgram ;;
		0) echo "Exiting..."; exit 0 ;;
	esac
done

