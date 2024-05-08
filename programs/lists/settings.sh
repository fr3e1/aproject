#/bin/bash


rem-task() {
clear
if [ -e tasks.txt ]; then
	rm tasks.txt
	echo "done"
else
	echo "save file does not exist"
fi
}

clear
echo

while true; do
	
	echo "You have selected the To-do list program!"
	echo "enter a choice:" 
	echo "[1] - continue to program"
	echo "[2] - delete save file (harmless, only clears tasks)"
	echo
	echo "[0] - exit"
	echo
	read -p ">" choice

	case $choice in 
		1) bash programs/lists/main.sh ;;
		2) rem-task ;;
		0) echo "Exiting..."; exit 0 ;;
	esac
done
