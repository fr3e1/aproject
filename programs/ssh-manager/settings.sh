#/bin/bash

remlist() {
clear
if [ -e programs/ssh-manager/list.txt ]; then
	rm programs/ssh-manager/list.txt
	echo "done"
else
	echo "saved list is not saved"
fi

}

clear
echo
while true; do

	echo "You have selected the ssh manager program!"
	echo "[1] - continue to program"
	echo "[2] - delete list (can't be undone)"
	echo
	echo "[0] - exit"
	echo
	read -p ">" choice

	case $choice in
		1) bash programs/ssh-manager/main.sh ;;
		2)remlist ;;
		0) echo "Exiting..."; exit 0 ;;
	esac
done
