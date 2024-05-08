#/bin/bash

remtask() {
clear
if [ -e tasks.txt ]; then
	rm history
	echo "done"
else
	echo  "save file does not exist, please try again"
fi
}

clear
echo 
while true; do 

	echo "You have selected the basic calculator program!"
	echo "enter a choice:"
	echo "[1] - continue to program"
	echo "[2] - delete history (won't affect program)"
	echo
	echo "[0] - exit"
	echo
	read -p ">" choice

	case $choice in 
		1) bash programs/calculator/main.sh ;;
		2) remtask ;;
		0) echo "Exiting..."; exit 0 ;;
	esac
done
