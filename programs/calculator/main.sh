#!/etc/bash




if [ -e history ]; then
	echo "history file exists, continuing"
else
	"creating history file.."
	touch history
fi


main() {
	echo
	echo "enter equation:"
	read -p ">" equation
	echo
	result=$(echo "$equation" | bc)
	clear
	echo "$result" >> history
	tail -n 5 history
}



clear
echo "must be integers only, use symbols + - * /"
echo "press Ctrl + c to exit"

while true; do
	main
done
